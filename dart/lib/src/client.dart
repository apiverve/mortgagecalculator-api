import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class MortgagecalculatorValidationException implements Exception {
  final List<String> errors;

  MortgagecalculatorValidationException(this.errors);

  @override
  String toString() => 'MortgagecalculatorValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Mortgage Calculator API client.
///
/// For more information, visit: https://apiverve.com/marketplace/mortgagecalculator?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [amount] (required) - The loan amount [min: 0]
/// * [rate] (required) - The interest rate (percentage) [min: 0, max: 100]
/// * [years] (required) - The loan term in years [min: 1, max: 50]
/// * [downpayment] - The down payment amount [min: 0]
/// * [annualPropertytax] - The annual property tax amount [min: 0]
/// * [annualHomeinsurance] - The annual home insurance amount [min: 0]
/// * [annualHoa] - The annual HOA amount [min: 0]
/// * [pmiRate] - Annual private mortgage insurance rate as a percentage of the loan, charged only when the loan-to-value ratio is above 80% [min: 0, max: 5]
/// * [extraMonthly] - Extra principal paid every month, to see how much sooner the loan is paid off and how much interest that saves [min: 0]
/// * [startDate] - Loan start (closing) date; the first payment falls the following month [format: date]
class MortgagecalculatorClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'amount': ValidationRule(type: 'number', required: true, min: 0),
    'rate': ValidationRule(type: 'number', required: true, min: 0, max: 100),
    'years': ValidationRule(type: 'integer', required: true, min: 1, max: 50),
    'downpayment': ValidationRule(type: 'number', required: false, min: 0),
    'annual_propertytax': ValidationRule(type: 'number', required: false, min: 0),
    'annual_homeinsurance': ValidationRule(type: 'number', required: false, min: 0),
    'annual_hoa': ValidationRule(type: 'number', required: false, min: 0),
    'pmi_rate': ValidationRule(type: 'number', required: false, min: 0, max: 5),
    'extra_monthly': ValidationRule(type: 'number', required: false, min: 0),
    'start_date': ValidationRule(type: 'string', required: false, format: 'date'),
  };

  MortgagecalculatorClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/mortgagecalculator',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [MortgagecalculatorValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw MortgagecalculatorValidationException(errors);
    }
  }

  /// Execute a request to the Mortgage Calculator API.
  ///
  /// Parameters are validated before sending the request.
  Future<MortgagecalculatorResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw MortgagecalculatorException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final response = await _httpClient.post(
        Uri.parse(baseUrl),
        headers: {
          'x-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return MortgagecalculatorResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw MortgagecalculatorException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw MortgagecalculatorException('Resource not found');
      } else {
        throw MortgagecalculatorException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is MortgagecalculatorException) rethrow;
      throw MortgagecalculatorException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Mortgage Calculator API client.
class MortgagecalculatorException implements Exception {
  final String message;

  MortgagecalculatorException(this.message);

  @override
  String toString() => 'MortgagecalculatorException: $message';
}

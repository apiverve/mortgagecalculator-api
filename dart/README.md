# Mortgage Calculator API - Dart/Flutter Client

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues and returns the loan-to-value ratio, with paid plans adding full amortization schedules, PMI and its removal date, payoff dates, and extra-payment scenarios showing months and interest saved.

[![pub package](https://img.shields.io/pub/v/apiverve_mortgagecalculator.svg)](https://pub.dev/packages/apiverve_mortgagecalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Mortgage Calculator API](https://apiverve.com/marketplace/mortgagecalculator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_mortgagecalculator: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_mortgagecalculator/apiverve_mortgagecalculator.dart';

void main() async {
  final client = MortgagecalculatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'amount': 570000,
      'rate': 6.8,
      'years': 30,
      'downpayment': 57000,
      'pmi_rate': 0.5,
      'extra_monthly': 200,
      'start_date': '2026-11-01'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "amount": 570000,
    "downpayment": 57000,
    "rate": 6.8,
    "years": 30,
    "total_interest_paid": 690975.44,
    "total_loan_payment": 1203975.44,
    "interestRatio": 57.39,
    "monthly_payment": {
      "total": 3558.13,
      "mortgage": 3344.38,
      "property_tax": 0,
      "hoa": 0,
      "home_insurance": 0,
      "pmi": 213.75
    },
    "annual_payment": {
      "total": 42697.51,
      "mortgage": 40132.51,
      "property_tax": 0,
      "hoa": 0,
      "home_insurance": 0,
      "pmi": 2565
    },
    "formatted": {
      "amount": "$570,000",
      "monthlyPayment": "$3,344.38",
      "totalInterestPaid": "$690,975.44",
      "totalLoanPayment": "$1,203,975.44"
    },
    "loan_amount": 513000,
    "ltv": 90,
    "payoff_date": "2056-11",
    "pmi": {
      "required": true,
      "rate": 0.5,
      "monthly": 213.75,
      "months_charged": 113,
      "removal_month": 114,
      "total": 24153.75,
      "removal_date": "2036-05"
    },
    "extra_payments": {
      "monthly": 200,
      "months_to_payoff": 304,
      "months_saved": 56,
      "total_interest_paid": 563208.85,
      "interest_saved": 127766.58,
      "payoff_date": "2052-03"
    },
    "amortization_schedule": [
      {
        "month": 1,
        "interest_payment": 2907,
        "principal_payment": 437.38,
        "remaining_balance": 512562.62,
        "date": "2026-12"
      },
      {
        "month": 2,
        "interest_payment": 2904.52,
        "principal_payment": 439.85,
        "remaining_balance": 512122.77,
        "date": "2027-01"
      },
      {
        "month": 3,
        "interest_payment": 2902.03,
        "principal_payment": 442.35,
        "remaining_balance": 511680.42,
        "date": "2027-02"
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Mortgage Calculator API](https://apiverve.com/marketplace/mortgagecalculator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)

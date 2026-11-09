/// Response models for the Mortgage Calculator API.

/// API Response wrapper.
class MortgagecalculatorResponse {
  final String status;
  final dynamic error;
  final MortgagecalculatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  MortgagecalculatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory MortgagecalculatorResponse.fromJson(Map<String, dynamic> json) => MortgagecalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? MortgagecalculatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Mortgage Calculator API.

class MortgagecalculatorData {
  num? amount;
  num? downpayment;
  num? rate;
  num? years;
  num? totalInterestPaid;
  num? totalLoanPayment;
  num? interestRatio;
  MortgagecalculatorDataMonthlyPayment? monthlyPayment;
  MortgagecalculatorDataAnnualPayment? annualPayment;
  MortgagecalculatorDataFormatted? formatted;
  num? loanAmount;
  num? ltv;
  String? payoffDate;
  MortgagecalculatorDataPmi? pmi;
  MortgagecalculatorDataExtraPayments? extraPayments;
  List<MortgagecalculatorDataAmortizationScheduleItem>? amortizationSchedule;

  MortgagecalculatorData({
    this.amount,
    this.downpayment,
    this.rate,
    this.years,
    this.totalInterestPaid,
    this.totalLoanPayment,
    this.interestRatio,
    this.monthlyPayment,
    this.annualPayment,
    this.formatted,
    this.loanAmount,
    this.ltv,
    this.payoffDate,
    this.pmi,
    this.extraPayments,
    this.amortizationSchedule,
  });

  factory MortgagecalculatorData.fromJson(Map<String, dynamic> json) => MortgagecalculatorData(
      amount: json['amount'],
      downpayment: json['downpayment'],
      rate: json['rate'],
      years: json['years'],
      totalInterestPaid: json['total_interest_paid'],
      totalLoanPayment: json['total_loan_payment'],
      interestRatio: json['interestRatio'],
      monthlyPayment: json['monthly_payment'] != null ? MortgagecalculatorDataMonthlyPayment.fromJson(json['monthly_payment']) : null,
      annualPayment: json['annual_payment'] != null ? MortgagecalculatorDataAnnualPayment.fromJson(json['annual_payment']) : null,
      formatted: json['formatted'] != null ? MortgagecalculatorDataFormatted.fromJson(json['formatted']) : null,
      loanAmount: json['loan_amount'],
      ltv: json['ltv'],
      payoffDate: json['payoff_date'],
      pmi: json['pmi'] != null ? MortgagecalculatorDataPmi.fromJson(json['pmi']) : null,
      extraPayments: json['extra_payments'] != null ? MortgagecalculatorDataExtraPayments.fromJson(json['extra_payments']) : null,
      amortizationSchedule: (json['amortization_schedule'] as List?)?.map((e) => MortgagecalculatorDataAmortizationScheduleItem.fromJson(e)).toList(),
    );
}

class MortgagecalculatorDataMonthlyPayment {
  num? total;
  num? mortgage;
  num? propertyTax;
  num? hoa;
  num? homeInsurance;
  num? pmi;

  MortgagecalculatorDataMonthlyPayment({
    this.total,
    this.mortgage,
    this.propertyTax,
    this.hoa,
    this.homeInsurance,
    this.pmi,
  });

  factory MortgagecalculatorDataMonthlyPayment.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataMonthlyPayment(
      total: json['total'],
      mortgage: json['mortgage'],
      propertyTax: json['property_tax'],
      hoa: json['hoa'],
      homeInsurance: json['home_insurance'],
      pmi: json['pmi'],
    );
}

class MortgagecalculatorDataAnnualPayment {
  num? total;
  num? mortgage;
  num? propertyTax;
  num? hoa;
  num? homeInsurance;
  num? pmi;

  MortgagecalculatorDataAnnualPayment({
    this.total,
    this.mortgage,
    this.propertyTax,
    this.hoa,
    this.homeInsurance,
    this.pmi,
  });

  factory MortgagecalculatorDataAnnualPayment.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataAnnualPayment(
      total: json['total'],
      mortgage: json['mortgage'],
      propertyTax: json['property_tax'],
      hoa: json['hoa'],
      homeInsurance: json['home_insurance'],
      pmi: json['pmi'],
    );
}

class MortgagecalculatorDataFormatted {
  String? amount;
  String? monthlyPayment;
  String? totalInterestPaid;
  String? totalLoanPayment;

  MortgagecalculatorDataFormatted({
    this.amount,
    this.monthlyPayment,
    this.totalInterestPaid,
    this.totalLoanPayment,
  });

  factory MortgagecalculatorDataFormatted.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataFormatted(
      amount: json['amount'],
      monthlyPayment: json['monthlyPayment'],
      totalInterestPaid: json['totalInterestPaid'],
      totalLoanPayment: json['totalLoanPayment'],
    );
}

class MortgagecalculatorDataPmi {
  bool? required;
  num? rate;
  num? monthly;
  num? monthsCharged;
  num? removalMonth;
  num? total;
  String? removalDate;

  MortgagecalculatorDataPmi({
    this.required,
    this.rate,
    this.monthly,
    this.monthsCharged,
    this.removalMonth,
    this.total,
    this.removalDate,
  });

  factory MortgagecalculatorDataPmi.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataPmi(
      required: json['required'],
      rate: json['rate'],
      monthly: json['monthly'],
      monthsCharged: json['months_charged'],
      removalMonth: json['removal_month'],
      total: json['total'],
      removalDate: json['removal_date'],
    );
}

class MortgagecalculatorDataExtraPayments {
  num? monthly;
  num? monthsToPayoff;
  num? monthsSaved;
  num? totalInterestPaid;
  num? interestSaved;
  String? payoffDate;

  MortgagecalculatorDataExtraPayments({
    this.monthly,
    this.monthsToPayoff,
    this.monthsSaved,
    this.totalInterestPaid,
    this.interestSaved,
    this.payoffDate,
  });

  factory MortgagecalculatorDataExtraPayments.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataExtraPayments(
      monthly: json['monthly'],
      monthsToPayoff: json['months_to_payoff'],
      monthsSaved: json['months_saved'],
      totalInterestPaid: json['total_interest_paid'],
      interestSaved: json['interest_saved'],
      payoffDate: json['payoff_date'],
    );
}

class MortgagecalculatorDataAmortizationScheduleItem {
  num? month;
  num? interestPayment;
  num? principalPayment;
  num? remainingBalance;
  String? date;

  MortgagecalculatorDataAmortizationScheduleItem({
    this.month,
    this.interestPayment,
    this.principalPayment,
    this.remainingBalance,
    this.date,
  });

  factory MortgagecalculatorDataAmortizationScheduleItem.fromJson(Map<String, dynamic> json) => MortgagecalculatorDataAmortizationScheduleItem(
      month: json['month'],
      interestPayment: json['interest_payment'],
      principalPayment: json['principal_payment'],
      remainingBalance: json['remaining_balance'],
      date: json['date'],
    );
}

class MortgagecalculatorRequest {
  num amount;
  num rate;
  num years;
  num? downpayment;
  num? pmiRate;
  num? extraMonthly;
  String? startDate;

  MortgagecalculatorRequest({
    required this.amount,
    required this.rate,
    required this.years,
    this.downpayment,
    this.pmiRate,
    this.extraMonthly,
    this.startDate,
  });

  Map<String, dynamic> toJson() => {
      'amount': amount,
      'rate': rate,
      'years': years,
      if (downpayment != null) 'downpayment': downpayment,
      if (pmiRate != null) 'pmi_rate': pmiRate,
      if (extraMonthly != null) 'extra_monthly': extraMonthly,
      if (startDate != null) 'start_date': startDate,
    };
}

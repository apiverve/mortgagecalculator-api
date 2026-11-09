declare module '@apiverve/mortgagecalculator' {
  export interface mortgagecalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface mortgagecalculatorResponse {
    status: string;
    error: string | null;
    data: MortgageCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface MortgageCalculatorData {
      amount:               number | null;
      downpayment:          number | null;
      rate:                 number | null;
      years:                number | null;
      totalInterestPaid:    number | null;
      totalLoanPayment:     number | null;
      interestRatio:        number | null;
      monthlyPayment:       Payment;
      annualPayment:        Payment;
      formatted:            Formatted;
      loanAmount:           number | null;
      ltv:                  number | null;
      payoffDate:           null | string;
      pmi:                  Pmi;
      extraPayments:        ExtraPayments;
      amortizationSchedule: AmortizationSchedule[];
  }
  
  interface AmortizationSchedule {
      month:            number | null;
      interestPayment:  number | null;
      principalPayment: number | null;
      remainingBalance: number | null;
      date:             null | string;
  }
  
  interface Payment {
      total:         number | null;
      mortgage:      number | null;
      propertyTax:   number | null;
      hoa:           number | null;
      homeInsurance: number | null;
      pmi:           number | null;
  }
  
  interface ExtraPayments {
      monthly:           number | null;
      monthsToPayoff:    number | null;
      monthsSaved:       number | null;
      totalInterestPaid: number | null;
      interestSaved:     number | null;
      payoffDate:        null | string;
  }
  
  interface Formatted {
      amount:            null | string;
      monthlyPayment:    null | string;
      totalInterestPaid: null | string;
      totalLoanPayment:  null | string;
  }
  
  interface Pmi {
      required:      boolean | null;
      rate:          number | null;
      monthly:       number | null;
      monthsCharged: number | null;
      removalMonth:  number | null;
      total:         number | null;
      removalDate:   null | string;
  }

  export default class mortgagecalculatorWrapper {
    constructor(options: mortgagecalculatorOptions);

    execute(callback: (error: any, data: mortgagecalculatorResponse | null) => void): Promise<mortgagecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: mortgagecalculatorResponse | null) => void): Promise<mortgagecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<mortgagecalculatorResponse>;
  }
}

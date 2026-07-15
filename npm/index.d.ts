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
      amortizationSchedule: AmortizationSchedule[];
  }
  
  interface AmortizationSchedule {
      month:            number | null;
      interestPayment:  number | null;
      principalPayment: number | null;
      remainingBalance: number | null;
  }
  
  interface Payment {
      total:         number | null;
      mortgage:      number | null;
      propertyTax:   number | null;
      hoa:           number | null;
      homeInsurance: number | null;
  }
  
  interface Formatted {
      amount:            null | string;
      monthlyPayment:    null | string;
      totalInterestPaid: null | string;
      totalLoanPayment:  null | string;
  }

  export default class mortgagecalculatorWrapper {
    constructor(options: mortgagecalculatorOptions);

    execute(callback: (error: any, data: mortgagecalculatorResponse | null) => void): Promise<mortgagecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: mortgagecalculatorResponse | null) => void): Promise<mortgagecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<mortgagecalculatorResponse>;
  }
}

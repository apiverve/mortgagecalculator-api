# Mortgage Calculator API - PHP Package

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues and returns the loan-to-value ratio, with paid plans adding full amortization schedules, PMI and its removal date, payoff dates, and extra-payment scenarios showing months and interest saved.

## Installation

Install via Composer:

```bash
composer require apiverve/mortgagecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Mortgagecalculator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'amount' => 570000,
    'rate' => 6.8,
    'years' => 30,
    'downpayment' => 57000,
    'pmi_rate' => 0.5,
    'extra_monthly' => 200,
    'start_date' => '2026-11-01'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Mortgagecalculator\Client;
use APIVerve\Mortgagecalculator\Exceptions\APIException;
use APIVerve\Mortgagecalculator\Exceptions\ValidationException;

try {
    $response = $client->execute(['amount' => 570000, 'rate' => 6.8, 'years' => 30, 'downpayment' => 57000, 'pmi_rate' => 0.5, 'extra_monthly' => 200, 'start_date' => '2026-11-01']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/mortgagecalculator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/mortgagecalculator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).

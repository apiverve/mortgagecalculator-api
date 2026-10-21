# Mortgage Calculator API - Ruby Gem

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues, with paid plans adding full amortization schedules.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_mortgagecalculator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_mortgagecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_mortgagecalculator'

# Initialize the client
client = APIVerve::Mortgagecalculator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  amount: 570000,
  rate: 6.8,
  years: 30
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ amount: 570000, rate: 6.8, years: 30 })
  puts response["data"]
rescue APIVerve::Mortgagecalculator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Mortgagecalculator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Mortgagecalculator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "amount": 570000,
    "downpayment": 0,
    "rate": 6.8,
    "years": 30,
    "total_interest_paid": 767750.49,
    "total_loan_payment": 1337750.49,
    "interestRatio": 57.39,
    "monthly_payment": {
      "total": 3715.97,
      "mortgage": 3715.97,
      "property_tax": 0,
      "hoa": 0,
      "home_insurance": 0
    },
    "annual_payment": {
      "total": 44591.68,
      "mortgage": 44591.68,
      "property_tax": 0,
      "hoa": 0,
      "home_insurance": 0
    },
    "formatted": {
      "amount": "$570,000",
      "monthlyPayment": "$3,715.97",
      "totalInterestPaid": "$767,750.49",
      "totalLoanPayment": "$1,337,750.49"
    },
    "amortization_schedule": [
      {
        "month": 1,
        "interest_payment": 3230,
        "principal_payment": 485.97,
        "remaining_balance": 569514.03
      },
      {
        "month": 2,
        "interest_payment": 3227.25,
        "principal_payment": 488.73,
        "remaining_balance": 569025.3
      },
      {
        "month": 3,
        "interest_payment": 3224.48,
        "principal_payment": 491.5,
        "remaining_balance": 568533.8
      }
    ]
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/mortgagecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/mortgagecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).

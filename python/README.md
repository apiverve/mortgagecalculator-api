Mortgage Calculator API
============

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues and returns the loan-to-value ratio, with paid plans adding full amortization schedules, PMI and its removal date, payoff dates, and extra-payment scenarios showing months and interest saved.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-mortgagecalculator.svg)](https://pypi.org/project/apiverve-mortgagecalculator/)

This is a Python wrapper for the [Mortgage Calculator API](https://apiverve.com/marketplace/mortgagecalculator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-mortgagecalculator
```

Using `pip3`:

```bash
pip3 install apiverve-mortgagecalculator
```

---

## Configuration

Before using the Mortgage Calculator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient

# Initialize the client with your APIVerve API key
api = MortgagecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Mortgage Calculator API documentation is found here: [https://docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient

# Initialize the client with your APIVerve API key
api = MortgagecalculatorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `MortgagecalculatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient, MortgagecalculatorAPIClientError

api = MortgagecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except MortgagecalculatorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient, MortgagecalculatorAPIClientError

api = MortgagecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except MortgagecalculatorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient, MortgagecalculatorAPIClientError

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

# Using context manager ensures proper cleanup
with MortgagecalculatorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except MortgagecalculatorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient

# Enable debug mode
api = MortgagecalculatorAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_mortgagecalculator.apiClient import MortgagecalculatorAPIClient

api = MortgagecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "amount": 570000,
    "rate": 6.8,
    "years": 30,
    "downpayment": 57000,
    "pmi_rate": 0.5,
    "extra_monthly": 200,
    "start_date": "2026-11-01"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

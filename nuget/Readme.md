Mortgage Calculator API
============

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues and returns the loan-to-value ratio, with paid plans adding full amortization schedules, PMI and its removal date, payoff dates, and extra-payment scenarios showing months and interest saved.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.MortgageCalculator.svg)](https://www.nuget.org/packages/APIVerve.API.MortgageCalculator)

This is a .NET wrapper for the [Mortgage Calculator API](https://apiverve.com/marketplace/mortgagecalculator?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.MortgageCalculator
```

Using the Package Manager:
```
nuget install APIVerve.API.MortgageCalculator
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.MortgageCalculator
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.MortgageCalculator"
5. Click on the APIVerve.API.MortgageCalculator package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Mortgage Calculator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.MortgageCalculator;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new MortgageCalculatorQueryOptions {
            Amount = 570000,
            Rate = 6.8,
            Years = 30,
            Downpayment = 57000,
            Pmi_rate = 0.5,
            Extra_monthly = 200,
            Start_date = "2026-11-01"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Mortgage Calculator API documentation is found here: [https://docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Mortgage Calculator API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.MortgageCalculator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new MortgageCalculatorQueryOptions {
            Amount = 570000,
            Rate = 6.8,
            Years = 30,
            Downpayment = 57000,
            Pmi_rate = 0.5,
            Extra_monthly = 200,
            Start_date = "2026-11-01"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.MortgageCalculator;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new MortgageCalculatorQueryOptions {
            Amount = 570000,
            Rate = 6.8,
            Years = 30,
            Downpayment = 57000,
            Pmi_rate = 0.5,
            Extra_monthly = 200,
            Start_date = "2026-11-01"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.MortgageCalculator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new MortgageCalculatorQueryOptions {
            Amount = 570000,
            Rate = 6.8,
            Years = 30,
            Downpayment = 57000,
            Pmi_rate = 0.5,
            Extra_monthly = 200,
            Start_date = "2026-11-01"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.MortgageCalculator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new MortgageCalculatorQueryOptions {
            Amount = 570000,
            Rate = 6.8,
            Years = 30,
            Downpayment = 57000,
            Pmi_rate = 0.5,
            Extra_monthly = 200,
            Start_date = "2026-11-01"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new MortgageCalculatorQueryOptions {
    Amount = 570000,
    Rate = 6.8,
    Years = 30,
    Downpayment = 57000,
    Pmi_rate = 0.5,
    Extra_monthly = 200,
    Start_date = "2026-11-01"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new MortgageCalculatorQueryOptions {
    Amount = 570000,
    Rate = 6.8,
    Years = 30,
    Downpayment = 57000,
    Pmi_rate = 0.5,
    Extra_monthly = 200,
    Start_date = "2026-11-01"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new MortgageCalculatorQueryOptions {
    Amount = 570000,
    Rate = 6.8,
    Years = 30,
    Downpayment = 57000,
    Pmi_rate = 0.5,
    Extra_monthly = 200,
    Start_date = "2026-11-01"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new MortgageCalculatorQueryOptions {
    Amount = 570000,
    Rate = 6.8,
    Years = 30,
    Downpayment = 57000,
    Pmi_rate = 0.5,
    Extra_monthly = 200,
    Start_date = "2026-11-01"
};

using (var apiClient = new MortgageCalculatorAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

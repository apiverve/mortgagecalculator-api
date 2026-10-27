# Mortgage Calculator iOS/macOS SDK

Mortgage Calculator computes monthly and annual loan payments from principal, interest rate, and term. It breaks totals down by principal, interest, property tax, insurance, and HOA dues, with paid plans adding full amortization schedules.

The Mortgage Calculator API is available on [APIVerve](https://apiverve.com/marketplace/mortgagecalculator?utm_source=cocoapods&utm_medium=referral&utm_content=readme), which has its full reference, pricing and a live test console.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2015%2B%20%7C%20macOS%2012%2B-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)

---

## Installation

### CocoaPods

Add this to your `Podfile`:

```ruby
pod 'APIVerveMortgageCalculator', '~> 1.2.3'
```

Then run:
```bash
pod install
```

This also installs `APIVerveCore`, which holds the types shared by every APIVerve pod (`APIResponse`, `APIVerveError`, `APIVerveValue`). `import APIVerveMortgageCalculator` re-exports it, so you never import it yourself, and using several APIVerve pods together never makes those names ambiguous.

---

## Quick Start

### Swift with Async/Await (iOS 13+)

```swift
import APIVerveMortgageCalculator

let client = MortgageCalculatorAPIClient(apiKey: "YOUR_API_KEY")

Task {
    do {
        let parameters: [String: Any] = [
            // Add your parameters here
        ]
        let response = try await client.execute(parameters: parameters)

        if response.isSuccess {
            print("Success:", response.data ?? [:])
        }
    } catch {
        print("Error:", error.localizedDescription)
    }
}
```

### Swift with Completion Handlers

```swift
import APIVerveMortgageCalculator

let client = MortgageCalculatorAPIClient(apiKey: "YOUR_API_KEY")

let parameters: [String: Any] = [
    // Add your parameters here
]

client.execute(parameters: parameters) { result in
    switch result {
    case .success(let response):
        if response.isSuccess {
            print("Success:", response.data ?? [:])
        } else {
            print("API Error:", response.error ?? "Unknown error")
        }
    case .failure(let error):
        print("Error:", error.localizedDescription)
    }
}
```

---

## Error Handling

Failures are `APIVerveError` (`MortgageCalculatorAPIError` is the same type):

```swift
client.execute(parameters: params) { result in
    switch result {
    case .success(let response):
        // Handle success
        break
    case .failure(let error):
        if error.isAuthenticationError {
            print("Invalid API key")
        } else if error.isRateLimitError {
            print("Rate limit exceeded")
        } else if error.isServerError {
            print("Server error")
        } else {
            print("Error:", error.localizedDescription)
        }
    }
}
```

---

## API Documentation

For detailed API documentation, visit: [https://docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=cocoapods&utm_medium=referral&utm_content=readme)

---

## Get Your API Key

Get your API key from [https://apiverve.com](https://apiverve.com?utm_source=cocoapods&utm_medium=referral&utm_content=readme)

---

## Support

- **Documentation:** [https://docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=cocoapods&utm_medium=referral&utm_content=readme)
- **Issues:** [GitHub Issues](https://github.com/apiverve/mortgagecalculator-api/issues)
- **Email:** hello@apiverve.com

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=cocoapods&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=cocoapods&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=cocoapods&utm_medium=referral&utm_content=readme).

---

## License

This SDK is released under the MIT License. See [LICENSE](LICENSE) for details.

---

## About APIVerve

[APIVerve](https://apiverve.com?utm_source=cocoapods&utm_medium=referral&utm_content=readme) provides production-ready REST APIs for developers. Fast, reliable, and easy to integrate.

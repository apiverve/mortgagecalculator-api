# Mortgage Calculator API

Mortgage Calculator is a simple tool for calculating mortgage payments. It returns the monthly payment, total interest, and more.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)
[![npm version](https://img.shields.io/npm/v/@apiverve/mortgagecalculator.svg)](https://www.npmjs.com/package/@apiverve/mortgagecalculator)

This is a Javascript Wrapper for the [Mortgage Calculator API](https://mortgagecalculator.apiverve.com?utm_source=npm&utm_medium=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/mortgagecalculator
```

Using yarn:
```shell
yarn add @apiverve/mortgagecalculator
```

---

## Configuration

Before using the Mortgage Calculator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=readme)

The Mortgage Calculator API documentation is found here: [https://docs.apiverve.com/ref/mortgagecalculator](https://docs.apiverve.com/ref/mortgagecalculator?utm_source=npm&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const mortgagecalculatorAPI = require('@apiverve/mortgagecalculator');
const api = new mortgagecalculatorAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  "amount": 570000,
  "rate": 6.8,
  "years": 30
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  "amount": 570000,
  "rate": 6.8,
  "years": 30
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  "amount": 570000,
  "rate": 6.8,
  "years": 30
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=npm&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

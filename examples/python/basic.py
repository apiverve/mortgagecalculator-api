"""
Mortgage Calculator API - Basic Usage Example

This example demonstrates the basic usage of the Mortgage Calculator API.
API Documentation: https://docs.apiverve.com/ref/mortgagecalculator
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/mortgagecalculator'

def call_mortgagecalculator_api():
    """
    Make a POST request to the Mortgage Calculator API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;amount&#x27;: 570000,
    &#x27;rate&#x27;: 6.8,
    &#x27;years&#x27;: 30,
    &#x27;downpayment&#x27;: 57000,
    &#x27;pmi_rate&#x27;: 0.5,
    &#x27;extra_monthly&#x27;: 200,
    &#x27;start_date&#x27;: &#x27;2026-11-01&#x27;
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Mortgage Calculator API...\n')

    result = call_mortgagecalculator_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')

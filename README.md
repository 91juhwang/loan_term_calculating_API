# Loan Term API Provider

API Provider that calculates and return the loan term quotes.
https://loan-term-calculator.herokuapp.com (API Only)

## Requirements

* ruby 2.3.1
* rails 5.2

## Usage & Endpoints

First request the authentication token from the server.

* POST `/signup`, params with `name`, `email`, `password`, and `password_confirmation`
This will return back the auth token to use it in the header like this
`'Authorization': auth_token`.

API Endpoints:

* GET `/quotes/:id`

* POST `/quotes`

* PUT `/quotes/:id`

* DELETE `/quotes`

## Database Model Deisgn

I would really appreciate an opportunity to discuss more about this topic in person!

Property has_many rent_rolls;

Property has_many expenses;

Quote table simply keeps the end results.

## Input JSON Data

I would've asked a bit more about the incoming JSON data structure, but because it was late at night, I assumed the incoming JSON structure as below.

```json
{
  "address": "123 street blvd. 21 New York, NY 11001",
  "rent_roll": [
    {
      "unit_number": 6,
      "monthly_rent": 20000.00,
      "vacancy": 2,
      "bedrooms": 3,
      "bathrooms": 1,
      "annual_total": 215000.00
    },
    {
      "unit_number": 14,
      "monthly_rent": 20000.00,
      "vacancy": 12,
      "bedrooms": 1,
      "bathrooms": 1,
      "annual_total": 215000.00
    },
    {
      "unit_number": 15,
      "monthly_rent": 20000.00,
      "vacancy": 12,
      "bedrooms": 2,
      "bathrooms": 1,
      "annual_total": 215000.00
    }
  ],
  "expenses": {
    "marketing": 10000.00,
    "taxes": 10000.00,
    "insurance": 50000.00,
    "repairs": 10000.00,
    "administration": 10000.00,
    "payroll": 50000.00,
    "utility": 5000,
    "management": 30000
  },
  "capitalization_rate": 10
}
```

## 10 Year Treasure Price

Another assumption I made was about the debt rate.
Assumption: `debt_rate = 10 year Treasury* + 200 bps`
this translates to 10 year Treasury here is equal to 2.88% and is increased by 2% making the debt rate as `4.88%`

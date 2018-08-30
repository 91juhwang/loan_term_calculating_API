# Loan Term API Provider

API Provider that calculates and return the loan term quotes.

## Requirements

* ruby 2.3.1
* rails 5.2

## Database Model Deisgn

Will update later.

## Input JSON Data

I would've asked a bit more about the incoming JSON data structure, but because it was late at night, I assumed the incoming JSON structure as below.

```json
{
  "address": "123 street blvd. 21 New York, NY 11001",
  "rent_roll": [
    {
      "unit_number": "2A",
      "monthly_rent": 20000.00,
      "vacancy": true,
      "bedrooms": 3,
      "bathrooms": 1
    },
    {
      "unit_number": "2D",
      "monthly_rent": 20000.00,
      "vacancy": false,
      "bedrooms": 1,
      "bathrooms": 1
    },
    {
      "unit_number": "2C",
      "monthly_rent": 20000.00,
      "vacancy": true,
      "bedrooms": 2,
      "bathrooms": 1
    }
  ],
  "expense": {
    "marketing": 1000.00,
    "taxes": 1000.00,
    "insurance": 5000.00,
    "repairs": 1000.00,
    "administration": 1000.00,
    "payroll": 5000.00,
    "management": 3000
  },
  "capitalization_rate": 10
}
```

## 10 Year Treasure Price

Another assumption I made was about the debt rate.
Assumption: `debt_rate = 10 year Treasury* + 200 bps`
this translates to 10 year Treasury here is equal to 2.88% and is increased by 2% making the debt rate as `4.88%`

## Endpoints

* GET `/quotes/:id`

* POST `/quotes`

* PUT `/quotes/:id`

* DELETE `/quotes`
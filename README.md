# Loan Term API Provider

API Provider that calculates and return the loan term quotes.
https://loan-term-calculator.herokuapp.com (API Only)

## Requirements

* ruby 2.3.1
* rails 5.2
* .env ENV['SECRET_KEY_BASE'] is needed to run it in a local machine.

## Usage & Endpoints

First request the authentication token from the server to get the auth_code.

* POST `/signup`, params with `name`, `email`, `password`, and `password_confirmation`
This will return back the auth token to use it in the header like this
`'Authorization': auth_token`.

API Endpoints:

* GET `/quotes/:id`

* POST `/quotes`
>> use the below JSON data structure

* PUT `/quotes/:id`

* DELETE `/quotes`

## Input JSON Data

Because I did not have the exact data type, I assumed the incoming JSON structure as below.

```json
{
  "address": "123 street blvd. 21 New York, NY 11001",
  "rent_roll": [
    {
      "unit_number": 6,
      "monthly_rent": 20000.00,
      "vacancy": 24,
      "bedrooms": 3,
      "bathrooms": 1,
      "annual_total": 215000.00
    },
    {
      "unit_number": 150,
      "monthly_rent": 20000.00,
      "vacancy": 142,
      "bedrooms": 1,
      "bathrooms": 1,
      "annual_total": 215000.00
    },
    {
      "unit_number": 150,
      "monthly_rent": 20000.00,
      "vacancy": 120,
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
  "capitalization_rate": 0.07
}
```

## 10 Year Treasure Price

Another assumption I made was about the debt rate.
Assumption: `debt_rate = 10 year Treasury* + 200 bps`
this translates to 10 year Treasury here is equal to 2.88% and is increased by 2% making the debt rate as `4.88%`

## Database Model Deisgn

Based on the 4 input fields, `address`, `rent_rolls`, `expenses`, and the `capitalization rate`, I decided that a `properties` table was necessary to connect first 3 inputs. Property will have many `rent_rolls` and `expenses` which we need to store the data in order to calculate the loan_amount quote. The overarching `Property` will be responsible for keeping track of the expenses and the rent_rolls, which makes it more scalable in the future for updating records.

I was first against creating Quotes table since storing calculations breaks the 3NF in many cases. However, I created Quote model as well since keeping track of quotes for the authenticated user seemed necessary. This way, in the future, a signed up user could retrieve all of their requested quotes in the past and make comparisons.

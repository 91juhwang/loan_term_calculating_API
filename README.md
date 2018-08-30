# Loan Term API Provider

API Provider that calculates and return the loan term quotes.

## Requirements

* ruby 2.3.1
* rails 5.2

## Database Model Deisgn

The application returns a calculated quotes for the user.
However, because storing calculation data depends on each other, it is not a good practice to store them in a database.
Since the calculation was about the `properties` and itstable was necessary

In order to reach the purpose of returning the loan term quotes for the commercial property, the `property`, `units`, and the `expenses` were created to keep track of independent


Breaking down of 4 inputs from the user, these 3 wer

Because

## Database Association

## Input JSON Data

PS. I would've asked a bit more about the incoming JSON data structure, but because it was late at night, I assumed the JSON input structure as below.

```json

```

## Endpoints
Net Operating Income (NOI) = total_annual_rent_collected - total_expenses
current_market_value = net_operating_income / capitalization_rate

capitalization_rate = Net Operating Income / Current Market Value

total_annual_rent_collected = Sum of rents per unit multiplied by 12

debt_rate = 10 year Treasury* + 200 bps

minimum_debt_service = NOI / debt_payment
- HINT​: Use a minimum debt service of 1.25 (i.e. 125% of the NOI)

property_value = NOI / cap_rate

DSCR constrained loan amount = (NOI / minimum_debt_sercvice) /

debt_rate

LTV constrained loan amount = property_value * Max LTV
- HINT​: Use a maximum LTV of 80%

Loan amount = The lesser of:
a. LTV constrained loan amount
b. DSCR constrained loan amount
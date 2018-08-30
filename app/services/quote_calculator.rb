class QuoteCalculator
  attr_reader :property, :cap_rate

  def initialize(property, cap_rate)
    @property = property
    @cap_rate = cap_rate
  end

  def total_monthly_rent_collected
    property.rent_rolls.sum(:monthly_rent)
  end

  def total_no_of_units
    property.rent_rolls.sum(:unit_number)
  end

  def total_annual_rent_collected
    (total_monthly_rent_collected / total_no_of_units) * 12
  end

  def total_expenses
    columns = ['marketing', 'taxes', 'insurance', 'repairs', 'administration', 'payroll', 'utility', 'management']
    property.expenses.last.attributes.extract!(*columns).values.sum
  end

  def net_operating_income
    total_annual_rent_collected - total_expenses
  end

  def debt_rate
    0.0488
  end

  def debt_payment
    net_operating_income / 1.25
  end

  def minimum_debt_service
    net_operating_income / debt_payment
  end

  def property_value
    net_operating_income / cap_rate
  end

  def dscr_constrained_loan_amount
    (net_operating_income / minimum_debt_service) / debt_rate
  end

  def ltv_constrained_loan_amount
    property_value * 0.8
  end

  def calculate_loan_amount
    [dscr_constrained_loan_amount, ltv_constrained_loan_amount].min
  end
end
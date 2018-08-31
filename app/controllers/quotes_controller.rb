class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :update, :destroy]

  def show
    json_response(@quote)
  end

  def create
    property = Property.find_or_create_by!(address: params[:address])
    property.expenses.create!(expense_params)
    rent_rolls = property.rent_rolls
    if rent_rolls.empty?
      rent_rolls.create!(rent_roll_params[:rent_roll])
    else
      rent_rolls.each_with_index { |rent_roll, index| rent_roll.update(rent_roll_params[:rent_roll][index]) }
    end

    response = create_quote(property)
    json_response(response, :created)
  end

  def update
    @quote.update(quote_update_params)
    head :no_content
  end

  def destroy
    @quote.destroy
    head :no_content
  end

  private

  def create_quote(property)
    quote_calculator = QuoteCalculator.new(property, params[:capitalization_rate])
    loan_amount = quote_calculator.calculate_loan_amount
    created_quote = Quote.create!(loan_amount: loan_amount, debt_rate: quote_calculator.debt_rate, created_by: current_user.email)
    { loan_amount: created_quote.loan_amount, debt_rate: created_quote.debt_rate }
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_update_params
    params.permit(:loan_amount, :debt_rate)
  end

  def expense_params
    params.require(:expenses).permit(:marketing, :taxes, :insurance, :repairs, :administration, :payroll, :utility, :management)
  end

  def rent_roll_params
    params.permit(rent_roll: [:unit_number, :monthly_rent, :vacancy, :bedrooms, :bathrooms, :annual_total])
  end
end

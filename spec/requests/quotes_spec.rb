require 'rails_helper'


RSpec.describe 'Quotes API' do
  let(:user) { create(:user) }
  let!(:property) { create(:property) }
  let!(:quote) { create(:quote, created_by: user.email) }
  let(:quote_id) { quote.id}
  let(:headers) { valid_headers }

  describe 'GET /quotes/:quote_id' do
    before { get "/quotes/#{quote_id}", params: {}, headers: headers }

    context 'when quotes exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when quote does not exist' do
      let(:quote_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /quotes' do
    context 'when request attributes are valid' do
      params =
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

      it 'returns status code 201' do
        post "/quotes", params: params.to_json, headers: headers
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/quotes", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /quotes/:quote_id' do
    let(:valid_attributes) { { loan_amount: 30.00 } }

    before { put "/quotes/#{quote_id}", params: valid_attributes.to_json, headers: headers }

    context 'when quote exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_quote = Quote.find(quote_id)
        expect(updated_quote.loan_amount).to eq(30.00)
      end
    end

    context 'when the item does not exist' do
      let(:quote_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /quotes/:quote_id' do
    before { delete "/quotes/#{quote_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

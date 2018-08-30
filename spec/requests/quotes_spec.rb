require 'rails_helper'


RSpec.describe 'Quotes API' do
  let!(:property) { create(:property) }
  let!(:quote) { create(:quote) }
  let(:quote_id) { quote.id}

  describe 'GET /quotes/:quote_id' do
    before { get "/quotes/#{quote_id}" }

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

  # describe 'POST /quotes' do
  #   context 'when request attributes are valid' do

  #     it 'returns status code 201' do
  #       post "/quotes", params: params
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when an invalid request' do
  #     before { post "/quotes", params: {} }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end
  #   end
  # end

  describe 'PUT /quotes/:quote_id' do
    let(:valid_attributes) { { loan_amount: 30.00 } }

    before { put "/quotes/#{quote_id}", params: valid_attributes }

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
    before { delete "/quotes/#{quote_id}", params: {} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

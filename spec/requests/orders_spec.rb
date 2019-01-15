require 'rails_helper'

RSpec.describe OrdersController do

  let!(:order_params) do
    {
      name: 'amine',
      mail: 'amine.dhobb@gmail.com',
      id: rand(100)
    }
  end

  describe 'POST /orders' do

    context 'valid request' do

      before do
        post '/orders', params: order_params.to_json,
         headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'invalid request' do
      before do
        order_params[:name] = nil
        post '/orders', params: order_params.to_json,
         headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end

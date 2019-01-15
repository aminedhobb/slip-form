require 'rails_helper'

RSpec.describe AnswersController do

  let(:order_params) do
    {
      customer_name: 'amine',
      customer_mail: 'amine.dhobb@gmail.com',
      order_id: rand(100)
    }
  end

  let!(:answer_params) do
    {
      customer_name: 'amine',
      customer_mail: 'amine.dhobb@gmail.com',
      order_id: rand(100),
      satisfaction_rating: rand(10),
      products_quality_rating: rand(5),
      shipping_rating: rand(10)
    }
  end


  describe 'GET /answers/new' do

    context 'valid request' do

      before do
        get '/answers/new', params: order_params
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid request' do

      before do
        get '/answers/new'
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end


  describe 'POST /answers' do

    context 'valid params' do
      before do
        post '/answers', params: answer_params.to_json,
          headers: { 'Content-Type' => 'application/json' }
      end

      it 'renders the accepted template' do
        expect(response).to render_template('accepted')
      end
    end

    context 'missing params' do
      before do
        answer_params[:satisfaction_rating] = nil
        post '/answers', params: answer_params.to_json,
          headers:{ 'Content-Type' => 'application/json' }
      end

      it 'redirects to the form' do
        path = new_answer_path(answer_params.slice(:customer_mail,
          :customer_name, :order_id))
        expect(response).to redirect_to(path)
      end
    end
  end
end

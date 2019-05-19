require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  let(:user) {create(:user)}
  describe 'login' do
    context 'with authentication' do
      it 'return success status' do
        sign_in user 
        get '/pages/show'
        expect(response).to have_http_status(:success)
      end
    end
    context 'without authentication' do
      it 'return fail status' do
        get '/pages/show'
        expect(response).to have_http_status(302)
      end
    end
  end
end

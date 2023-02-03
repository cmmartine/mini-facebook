require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns a 200 success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a 200 success response' do
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end
  end

end

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns a 200 success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a 200 success response' do
      get :new
      expect(response).to be_successful
    end
  end
end

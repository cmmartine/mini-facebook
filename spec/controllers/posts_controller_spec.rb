require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a 200 success response" do
      get :index, session: valid_session
      expect(response).to be_successful
    end
  end
end

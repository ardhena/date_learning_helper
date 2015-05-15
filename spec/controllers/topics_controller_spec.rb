require 'spec_helper'

describe TopicsController do

  let(:valid_session) { {} }

  context 'user is logged in' do
    let(:user) { build(:user) }

    before do
      sign_in user
      controller.stub(:user_signed_in?).and_return(true)
      controller.stub(:current_user).and_return(user)
      controller.stub(:authenticate_user!).and_return(user)
    end

    describe 'GET index' do
    end
    describe 'GET new' do
    end
    describe 'GET edit' do
    end
    describe 'POST create' do
    end
    describe 'PUT update' do
    end
    describe 'DELETE destroy' do
    end
  end

  context 'user is not logged in' do
    before do
      controller.stub(:user_signed_in?).and_return(false)
      controller.stub(:current_user).and_return(nil)
      controller.stub(:authenticate_user!).and_return(false)
    end

    describe 'GET index' do
      #it 'redirects guest to the login page' do
      #  get :index, {}, valid_session
      #  expect(response).to redirect_to(new_user_session_path)
      #end
    end
  end

end
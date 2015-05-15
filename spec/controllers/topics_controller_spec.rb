require 'spec_helper'

describe TopicsController do

  let(:valid_session) { {} }

  context 'user is logged in' do
    let(:user) { create(:user) }

    before do
      sign_in user
      controller.stub(:user_signed_in?).and_return(true)
      controller.stub(:current_user).and_return(user)
      controller.stub(:authenticate_user!).and_return(user)
    end

    describe 'GET index' do
      let(:user_topic) { Topic.create(name: 'foo', user_id: user.id) }
      let(:not_user_topic) { Topic.create(name: 'bar') }

      it 'lists all topics of current user' do
        get :index, {}, valid_session
        expect(controller.topics).to eq(user.topics)
      end
    end
    describe 'POST create' do
      context 'topic is valid' do
        it 'saves new topic'
        it 'redirects to new topic page'
      end
      context 'topic is invalid' do
        it 're-renders new action'
      end
    end
    describe 'PUT update' do
      context 'topic is valid' do
        it 'updates topic'
        it 'redirects to topic page'
      end
      context 'topic is invalid' do
        it 're-renders edit action'
      end
    end
    describe 'DELETE destroy' do
      it 'destroys topic'
      it 'redirects to topics page'
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
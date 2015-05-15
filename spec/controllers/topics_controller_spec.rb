require 'spec_helper'

describe TopicsController do

  let(:valid_session) { {} }

  context 'user is logged in' do

    describe 'GET index' do

      let(:user) { create(:user) }
      before do
        sign_in user
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
      end
      let(:user_topic) { Topic.create(name: 'foo', user_id: user.id) }
      let(:not_user_topic) { Topic.create(name: 'bar') }

      it 'lists all topics of current user' do
        get :index, {}, valid_session
        expect(controller.topics).to eq(user.topics)
      end
    end

    describe 'POST create' do

      let(:user) { create(:user) }

      before do
        sign_in user
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
      end

      context 'topic is valid' do
        it 'saves new topic' do
          expect {
            post :create, { topic: attributes_for(:topic) }
          }.to change(Topic, :count).by(1)
        end
        it 'saves new topic as user\'s' do
          post :create, { topic: attributes_for(:topic) }
          expect(controller.topic.user_id).to eq(user.id)
        end
        it 'redirects to new topic page' do
          post :create, { topic: attributes_for(:topic) }
          expect(response).to redirect_to(topic_path(Topic.last))
        end
      end
      context 'topic is invalid' do
        it 're-renders new action' do
          post :create, { topic: { name: nil} }
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      let(:user) { create(:user) }
      let(:topic) { create(:topic) }

      before do
        sign_in user
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
      end

      context 'topic is valid' do
        it 'updates topic' do
          put :update, { id: topic.id, topic: { name: "WW I" } }
          expect(Topic.find(topic.id).name).to eq("WW I")
        end
        it 'redirects to topic page' do
          put :update, { id: topic.id, topic: { name: "WW I" } }
          expect(response).to redirect_to(topic_path(Topic.find(topic.id)))
        end
      end
      context 'topic is invalid' do
        it 're-renders edit action' do
          put :update, { id: topic.id, topic: { name: nil } }
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do

      let(:user) { create(:user) }
      let(:topic) { create(:topic) }

      before do
        sign_in user
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
        topic.update(user_id: user.id)
      end

      it 'destroys topic' do
        expect {
          delete :destroy, { id: topic.id }
        }.to change(Topic, :count).by(-1)
      end
      it 'redirects to topics page' do
        delete :destroy, { id: topic.id }
        expect(response).to redirect_to(topics_path)
      end
    end
  end

  context 'user is not logged in' do
    before do
      controller.stub(:user_signed_in?).and_return(false)
      controller.stub(:current_user).and_return(nil)
      controller.stub(:authenticate_user!).and_return(false)
    end

    describe 'GET index' do
      it 'redirects guest to the login page'
    end
  end

end
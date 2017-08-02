# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:course) { create :course }
  let(:comment) { create :comment, course: course, user: user }

  let(:valid_attrs) { attributes_for(:comment) }
  let(:invalid_attrs) { attributes_for(:comment, content: '') }
  let(:update_attrs) { attributes_for(:comment, content: 'new content') }

  before(:each) { sign_in user }

  describe 'GET #index' do
    before(:each) { get :index }

    it { is_expected.to render_template :index }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new comment' do
        expect{
          post :create, course_id: course.id, comment: valid_attrs
        }.to change(Comment,:count).by(1)
      end

      it 'redirects to the course' do
        post :create, course_id: course.id, comment: valid_attrs

        expect(response).to redirect_to course
      end
    end

    context 'with invalid params' do
      let(:referer) { "courses/#{course.id}" }

      before(:each) do
        request.env['HTTP_REFERER'] = referer
      end

      it 'does not save the new comment' do
        expect{
          post :create, course_id: course.id, comment: invalid_attrs
        }.to_not change(Comment, :count)
      end

      it 'redirects back' do
        post :create, course_id: course.id, comment: invalid_attrs

        expect(response).to redirect_to referer
      end
    end
  end

  # @TODO method is broken, there is no route for comments#show & :edit template
  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        put :update, course_id: course.id, id: comment.id, comment: update_attrs,
        format: :json
      end

      # it "changes comment's attributes" do
      #   comment.reload
      #   expect(comment.content).to eq(update_attrs[:content])
      # end
      #
      # it 'returns http ok status' do
      #   expect(response).to have_http_status(:ok)
      # end
    end

    context 'with invalid params' do
      before(:each) do
        put :update, course_id: course.id, id: comment.id, comment: invalid_attrs,
        format: :json
      end

      it "does not change comment's attributes" do
        comment.reload
        expect(comment.content).to_not eq(invalid_attrs[:content])
      end

      it 'returns http unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when :html format' do
      it 'redirects to comments' do
        delete :destroy, course_id: course.id, id: comment.id

        expect(response).to redirect_to comments_path
      end
    end

    context 'when :json format' do
      it 'returns http no_content status' do
        delete :destroy, course_id: course.id, id: comment, format: :json

        expect(response).to have_http_status :no_content
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { create :admin }
  let(:course) { create :course }

  let(:valid_attrs) { attributes_for(:course) }
  let(:invalid_attrs) { attributes_for(:course, language: '') }
  let(:update_attrs) { attributes_for(:course, language: 'new language') }

  before(:each) { sign_in user }

  describe 'GET #index' do
    before(:each) { get :index }

    it { is_expected.to render_template :index }
  end

  describe 'GET #new' do
    before(:each) { get :new }

    it { is_expected.to render_template :new }
  end

  describe 'GET #show' do
    before(:each) { get :show, id: course.id }

    it { is_expected.to render_template :show }
  end

  describe 'GET #edit' do
    before(:each) { get :edit, id: course.id }

    it { is_expected.to render_template :edit }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new course' do
        expect{
          post :create, course: valid_attrs
        }.to change(Course, :count).by(1)
      end

      it 'redirects to the root_path' do
        post :create, course: valid_attrs

        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid params' do
      it 'does not save the new course' do
        expect{
          post :create, course: invalid_attrs
        }.to_not change(Comment,:count)
      end

      it 'redirects back' do
        post :create, course: invalid_attrs

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) { put :update, id: course.id, course: update_attrs }

      it "changes course's attributes" do
        course.reload
        expect(course.language).to eq(update_attrs[:language])
      end

      it { is_expected.to redirect_to course }
    end

    context 'with invalid params' do
      before(:each) { put :update, id: course.id, course: invalid_attrs }

      it "does not change course's attributes" do
        course.reload
        expect(course.language).to_not eq(invalid_attrs[:language])
      end

      it { is_expected.to render_template :edit }
    end
  end

  describe 'PUT #approve' do
    before(:each) { put :approve, id: course.id }

    it { is_expected.to redirect_to course }
  end

  describe 'DELETE #destroy' do
    before(:each) { delete :destroy, id: course.id }

    it { is_expected.to redirect_to root_path}
  end
end

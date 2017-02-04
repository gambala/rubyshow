require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user){
    FactoryGirl.create(:user,
      role: 'admin'
    )
  }
  let(:course){
    FactoryGirl.create(:course, 
      title: 'mkdev: Ruby on Rails для самых маленьких',
      language: 'Русский',
      approved: true,
      paid: true
    )
  }
  describe 'create comment' do
    it 'create comment for user with valid params' do
      sign_in user
      post "/courses/#{course.id}/comments", :comment => {
        content: 'valid opinion',
        rating: 4,
        graduate: true,
        kind: 'opinion'
      }

      expect(response).to redirect_to(course_path(course))
      follow_redirect!
      expect(response.code).to eq("200")
      expect(Course.find(course.id).comments.where(content: 'valid opinion').count).to eq(1)
    end

    it 'does not create comment for user without valid params' do
      sign_in user
      visit root_path
      post "/courses/#{course.id}/comments", :comment => {
        content: nil,
      }

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.code).to eq("200")
      expect(Course.find(course.id).comments.where(content: 'invalid comment').count).to eq(0)
    end

    it 'does not create comment for guest' do
      post "/courses/#{course.id}/comments", :comment => {
        content: 'valid opinion',
        rating: 4,
        graduate: true,
        kind: 'opinion'
      }

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.code).to eq("200")
    end
  end
end
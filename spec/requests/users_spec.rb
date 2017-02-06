require 'rails_helper'

RSpec.describe 'Users', type: :request do
  
  describe 'user without github_name and comments' do
    let(:user){ FactoryGirl.create(:user, username: 'petr ivanov') }

    it 'render only username' do
      get "/user/#{user.id}"
      expect(response.code).to eq('200')
      expect(response.body).to include('petr ivanov')
      expect(response.body).not_to include('Отзывы пользователя')
      expect(response.body).not_to include('github.com/')
    end
  end

  describe 'user with github_name and comments' do
    let(:user){ FactoryGirl.create(
      :user,
      username: 'petr ivanov',
      github_name: 'petr_hacker'
    )}
    
    it 'render username, github_name and comments' do
      course = FactoryGirl.create(:course)
      FactoryGirl.create(
        :comment,
        content: 'very very best course',
        user_id: user.id,
        course_id: course.id
      )

      get "/user/#{user.id}"
      expect(response.code).to eq('200')
      expect(response.body).to include('petr ivanov')
      expect(response.body).to include("github.com/#{user.github_name}")
      expect(response.body).to include('Отзывы пользователя')
    end
  end    
end

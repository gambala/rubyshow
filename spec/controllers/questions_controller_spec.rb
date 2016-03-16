require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user) { create(:user) }
  let(:course) { create(:course)}
  let(:question) { create(:question, user: @user) }

  describe "GET #new" do
    login_user
    before { get :new, course_id: course }
    it 'assigns new question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end
    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe "GET #create" do
    login_user
    let(:request) { post :create, course_id: course, question: attributes_for(:question) }
    it 'assigns new question to @question' do
      expect { request }.to change(course.questions, :count).by(1)
    end
    it 'correctly assigns user' do
      expect { request }.to change(@user.questions, :count).by(1)
    end
    it "redirect to index" do
      request
      expect(response).to redirect_to course_questions_path(course)
    end
  end

end

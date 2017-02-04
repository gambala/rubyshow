require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe 'listring courses' do
    before(:all) do
      FactoryGirl.create(:course, 
        title: 'ruby-course for juniors',
        language: 'Русский',
        approved: true,
        paid: false        
      )
      FactoryGirl.create(:course, 
        title: 'ruby-course for middle developers',
        language: 'Русский',
        approved: true,
        paid: true
      )
      FactoryGirl.create(:course, 
        title: 'ruby-course for middle seniors',
        language: 'Русский',
        approved: true,
        paid: true
      )
      FactoryGirl.create(:course, 
        title: 'ruby for zombie',
        language: "English",
        approved: true,
        paid: false
      )
      FactoryGirl.create(:course, 
        title: 'ruby for zombie 2',
        language: "English",
        approved: true,
        paid: true
      )
      FactoryGirl.create(:course, 
        title: 'RoR for one week',
        language: "English",
        approved: true,
        paid: true
      )
      FactoryGirl.create(:course, 
        title: 'unapproved course',
        language: "English",
        approved: false
      )
    end
    
    it 'show only approved courses' do
      get '/courses'

      expect(response.code).to eq("200")
      expect(response.body).to include("ruby-course for juniors")
      expect(response.body).to include("ruby-course for middle developers")
      expect(response.body).to include("ruby-course for middle seniors")
      expect(response.body).to include("ruby for zombie")
      expect(response.body).to include("ruby for zombie 2")
      expect(response.body).to include("RoR for one week")
      expect(response.body).not_to include("unapproved course")
    end

    describe 'searching courses' do
      it 'searching by title' do
        get '/courses?title=ruby-course'

        expect(response.code).to eq("200")
        expect(response.body).to include("ruby-course for juniors")
        expect(response.body).to include("ruby-course for middle developers")
        expect(response.body).to include("ruby-course for middle seniors")
        expect(response.body).not_to include("ruby for zombie")
        expect(response.body).not_to include("ruby for zombie 2")
        expect(response.body).not_to include("RoR for one week")
      end

      it 'searching by language' do
        get '/courses?language=English'

        expect(response.code).to eq("200")
        expect(response.body).not_to include("ruby-course for juniors")
        expect(response.body).not_to include("ruby-course for middle developers")
        expect(response.body).not_to include("ruby-course for middle seniors")
        expect(response.body).to include("ruby for zombie")
        expect(response.body).to include("ruby for zombie 2")
        expect(response.body).to include("RoR for one week")
      end

      it 'searching by paid' do
        get '/courses?paid=1'

        expect(response.code).to eq("200")
        expect(response.body).not_to include("ruby-course for juniors")
        expect(response.body).to include("ruby-course for middle developers")
        expect(response.body).to include('ruby-course for middle seniors')
        expect(response.body).not_to include('ruby for zombie</a>')
        expect(response.body).to include('ruby for zombie 2')
        expect(response.body).to include('RoR for one week')
      end
    end
  end

  describe 'show course' do
    before(:all){
      @course = FactoryGirl.create(:course, 
        title: 'ruby-course for juniors part two',
        url: 'http://www.some_site.org/courses/ruby_course_for_juniors',
        language: 'Русский',
        approved: true,
        paid: false        
      )

      FactoryGirl.create(:comment,
        kind: 2,
        graduate: true,
        rating: 3,
        content: 'good course',
        course_id: @course.id
      )
      FactoryGirl.create(:comment,
        kind: 2,
        graduate: true,
        rating: 5,
        content: 'perfect course, I need one more',
        course_id: @course.id
      )
      FactoryGirl.create(:comment,
        kind: 2,
        graduate: true,
        content: 'i really like it',
        rating: 4,
        course_id: @course.id
      )
    }
    
    it 'contain course title, url, description and language' do
      get "/courses/#{@course.id}"
      
      expect(response.code).to eq("200")
      expect(response.body).to include(@course.title)
      expect(response.body).to include(@course.url)
      expect(response.body).to include(@course.description)
      expect(response.body).to include('<dd itemprop="inLanguage">'+@course.language+'</dd>')
    end
    
    it 'show graduates count' do
      get "/courses/#{@course.id}"

      expect(response.code).to eq("200")
      expect(response.body).to include('<dt>Количество учеников:</dt><dd>3</dd>')
    end
    
    it 'show rating' do
      get "/courses/#{@course.id}"

      expect(response.code).to eq("200")
      expect(response.body).to include('<dt>Средняя оценка:</dt><dd itemprop="aggregateRating">4.0</dd>')
    end
  end

  describe 'create course' do
    let(:user){
      FactoryGirl.create(:user,
        role: 'admin'
      )
    }
    before(:each){
      sign_in user
    }
    it 'create course by admin with valid params' do
      post "/courses", :course => {
        title: 'new course about ruby',
        description: 'new really free great course',
        language: 'English',
        url: 'http://www.courses',
        paid: 'false'
      }

      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response.code).to eq("200")
      expect(Course.where(title: 'new course about ruby').count).to eq(1)
    end

    it 'doe not create course by admin with invalid params' do
      courses_count = Course.all.count
      post "/courses", :course => {
        title: 'ruby-course'
      }

      expect(response.code).to eq("200")
      expect(Course.all.count).to eq(courses_count)
    end
  end

  describe 'update course' do
    it 'update course by admin with valid params' do
      user = FactoryGirl.create(:user,
        role: 'admin'
      )
      course = FactoryGirl.create(:course,
        title: 'ruby course',
        description: 'just one course',
        language: 'English',
        url: 'http://www.courses.com/first',
        paid: 'false'
      )
      sign_in user

      patch "/courses/#{course.id}", :course => {
        title: 'Новый супер курс',
        description: 'описание курса',
        language: 'Русский',
        url: 'http://www.ruby-course.ru/first',
        paid: 'true' 
      }

      expect(response).to redirect_to(course_path(course))
      follow_redirect!

      expect(response.code).to eq("200")
      updated_course = Course.find_by(title: 'Новый супер курс')
      expect(updated_course.title).to eq('Новый супер курс')
      expect(updated_course.description).to eq('описание курса')
      expect(updated_course.language).to eq('Русский')
      expect(updated_course.url).to eq('http://www.ruby-course.ru/first')
      expect(updated_course.paid).to eq(true)
    end

    it 'does not update course by guest' do
      course = FactoryGirl.create(:course,
        title: 'ruby course'
      )

      patch "/courses/#{course.id}", :course => {
        title: 'Новый супер курс 2'
      }

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.code).to eq("200")
      expect(Course.where(title: 'Новый супер курс 2').count).to eq(0)
      expect(Course.where(title: 'ruby course').count).to eq(1)
    end
  end

  describe 'destroy course' do
    it 'destroy course by admin' do
      user = FactoryGirl.create(:user,
        role: 'admin'
      )
      course = FactoryGirl.create(:course,
        title: 'ruby course v2'
      )
      sign_in user

      delete "/courses/#{course.id}"
      expect(Course.where(title: 'ruby course v2').count).to eq(0)
    end
    
    it 'does not destroy course by guest' do
      course = FactoryGirl.create(:course,
        title: 'ruby course v3'
      )
      delete "/courses/#{course.id}"

      expect(response).to redirect_to(root_path)
      expect(Course.where(title: 'ruby course v3').count).to eq(1)
    end
  end

  describe 'approve course' do
    let(:user){
      FactoryGirl.create(:user,
        role: 'admin'
      )
    }

    it 'approved course by admin' do
      course = FactoryGirl.create(:course,
        approved: false
      )

      sign_in user
      put "/courses/#{course.id}/approve"

      expect(response).to redirect_to(course_path(course))
      follow_redirect!
      expect(response.code).to eq("200")
      expect(Course.find(course.id).approved).to eq(true)
    end
    
    it 'does not approve approved course by admin' do
      course = FactoryGirl.create(:course,
        approved: true
      )
      sign_in user
      put "/courses/#{course.id}/approve" 
      
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.code).to eq("200")
    end

    it 'does not approve course by guest' do
      course = FactoryGirl.create(:course,
        approved: false
      )

      put "/courses/#{course.id}/approve" 
      
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.code).to eq("200")
      expect(Course.find(course.id).approved).to eq(false)
    end
  end
end
# frozen_string_literal: true

require 'rails_helper'

describe Course, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of :url }
    it { should validate_presence_of :description }
    it { should validate_presence_of :language }
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
  end

  describe 'attribute reader tests' do
    let(:course) do
      FactoryGirl.create(
        :course,
        title: 'Simple title',
        description: 'Some descriptin for course',
        language: 'English',
        paid: true,
        url: 'https://example.com/best-rails-course/',
        approved: true
      )
    end

    it 'has attribute title' do
      expect(course.title).to eq('Simple title')
    end

    it 'has attribute description' do
      expect(course.description).to eq('Some descriptin for course')
    end

    it 'has attribute language' do
      expect(course.language).to eq('English')
    end

    it 'has attribute paid' do
      expect(course.paid).to eq(true)
    end

    it 'has attribute url' do
      expect(course.url).to eq('https://example.com/best-rails-course/')
    end

    it 'has attribute approve' do
      expect(course.approved).to eq(true)
    end
  end

  describe 'relation tests' do
    it { should have_many :comments }
  end

  describe 'scope tests' do
    before(:all) do
      Course.destroy_all
      @approved_free_course = FactoryGirl.create(:free_course)
      @approved_paid_course = FactoryGirl.create(:paid_course)
      @unapproved_course = FactoryGirl.create(:unapproved_course)
    end

    it 'scope approved' do
      expect(Course.approved.count).to eq(2)
      expect(Course.approved).to include(@approved_free_course)
      expect(Course.approved).to include(@approved_paid_course)
    end

    it 'scope unapproved' do
      expect(Course.unapproved.count).to eq(1)
      expect(Course.unapproved).to include(@unapproved_course)
    end

    it 'scope free' do
      expect(Course.free.count).to eq(1)
      expect(Course.free).to include(@approved_free_course)
    end

    it 'scope paid' do
      expect(Course.paid.count).to eq(1)
      expect(Course.paid).to include(@approved_paid_course)
    end
  end

  describe 'method tests' do
    before(:all) do
      @course = FactoryGirl.create(:free_course)
      FactoryGirl.create(:opinion_comment, course: @course, rating: 2, user: FactoryGirl.create(:user))
      FactoryGirl.create(:opinion_comment, course: @course, rating: 3, user: FactoryGirl.create(:user))
      FactoryGirl.create(:opinion_comment, course: @course, rating: 4, user: FactoryGirl.create(:user))
      FactoryGirl.create(:opinion_comment, course: @course, rating: 3, user: FactoryGirl.create(:user))
    end

    it 'approve!' do
      unapproved_course = FactoryGirl.create(:unapproved_course)
      expect(unapproved_course.approved).to eq(false)
      unapproved_course.approve!
      expect(unapproved_course.approved).to eq(true)
    end

    it 'graduates with comments' do
      expect(@course.graduates).to eq([true, true, true, true])
    end

    it 'graduates without comments' do
      course = FactoryGirl.create(:free_course)
      expect(course.graduates).to eq([])
    end

    it 'rated? with comments' do
      expect(@course.rated?).to eq(true)
    end

    it 'rated? without comments' do
      course = FactoryGirl.create(:free_course)
      expect(course.rated?).to eq(false)
    end

    it 'rating with comments' do
      expect(@course.rating).to eq(3)
    end

    it 'rating without comments' do
      course = FactoryGirl.create(:free_course)
      expect(course.rating).to eq(0)
    end

    describe 'private methods' do
      it 'scores' do
        expect(@course.send(:scores)).to eq([2, 3, 4, 3])
      end
    end
  end
end

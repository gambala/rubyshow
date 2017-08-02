# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  describe 'validation tests' do
    it { should validate_inclusion_of(:rating).in_range(1..5).allow_nil }
    it { should validate_presence_of :content }
    it { should define_enum_for(:kind).with( { comment: 1, opinion: 2, question: 3 } ) }

    describe 'with grad' do
      subject { Comment.new(kind: 2) }
      it { should validate_acceptance_of(:graduate) }
    end
  end

  describe 'attribute reader tests' do
    let(:comment) do
      FactoryGirl.create(
        :comment,
        content: 'just comment',
        kind: 2,
        graduate: true,
        rating: 3,
      )
    end

    it 'has attribute content' do
      expect(comment.content).to eq('just comment')
    end
    it 'has attribute kind' do
      expect(comment.kind).to eq('opinion')
    end
    it 'has attribute graduate' do
      expect(comment.graduate).to be_truthy
    end
    it 'has attribute rating' do
      expect(comment.rating).to eq(3)
    end
  end

  describe 'relation tests' do
    it { should belong_to :course }
    it { should belong_to :user }
  end

  describe 'method tests' do
    describe 'grad' do
      it 'if opinion?' do
        comment = FactoryGirl.create(:opinion_comment)
        expect(comment.grad).to be_truthy
      end
      it 'if not opinion?' do
        comment = FactoryGirl.create(
          :comment,
          kind: 1
        )
        expect(comment.grad).to be_falsy
      end
    end
  end
end

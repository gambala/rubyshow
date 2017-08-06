# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'attribute reader tests' do
    let(:user) do
      FactoryGirl.create(
        :user,
        email: 'admin@example.com',
        role: 'admin',
        provider: 'any provider',
        uid: '1234567890',
        username: 'ivan ivanov',
        github_name: 'ivan_ivanov'
      )
    end

    it 'has attribute email' do
      expect(user.email).to eq('admin@example.com')
    end

    it 'has attribute role' do
      expect(user.role).to eq('admin')
    end

    it 'has attribute provider' do
      expect(user.provider).to eq('any provider')
    end

    it 'has attribute uid' do
      expect(user.uid).to eq('1234567890')
    end

    it 'has attribute username' do
      expect(user.username).to eq('ivan ivanov')
    end

    it 'has attribute github_name' do
      expect(user.github_name).to eq('ivan_ivanov')
    end
  end

  describe 'relation tests' do
    it { should have_many :comments }
  end

  describe 'method tests' do
    it 'admin if role is admin' do
      user = User.new
      expect(user.admin?).to be_falsy
    end

    it 'not admin if role is not admin' do
      user = User.new(role: 'admin')
      expect(user.admin?).to be_truthy
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string           default("user"), not null
#  provider               :string
#  uid                    :string
#  username               :string
#  github_name            :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

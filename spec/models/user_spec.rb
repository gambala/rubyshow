require 'rails_helper'

describe User, type: :model do
  it { should have_many :comments }
  it { should have_many :questions }
  it { should have_many :answers }
end

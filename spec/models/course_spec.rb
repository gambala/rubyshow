require 'rails_helper'

describe Course, type: :model do
  it { should have_many :comments }
  it { should have_many(:comments).dependent(:destroy)}
end

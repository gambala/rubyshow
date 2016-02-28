require 'rails_helper'

describe Course, type: :model do
  it { should have_many :comments }
end

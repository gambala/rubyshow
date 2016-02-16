require 'rails_helper'

describe User, type: :model do
  it { should have_many :comments }
end

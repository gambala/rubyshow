require 'rails_helper'

describe User, type: :model do
  it { should have_many :comments }
  it { should have_many :graduates }
  it { should have_many(:courses).through(:graduates) }
end

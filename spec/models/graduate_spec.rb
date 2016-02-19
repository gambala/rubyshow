require 'rails_helper'

describe Graduate, type: :model do
  it { should belong_to :user }
  it { should belong_to :course }
end

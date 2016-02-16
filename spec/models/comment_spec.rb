require 'rails_helper'

describe Comment, type: :model do
  it { should belong_to :course }
  it { should belong_to :user }
end

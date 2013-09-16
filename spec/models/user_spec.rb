require 'spec_helper'

describe User do
  it "의 email이 user1@gmail.com이 맞는지?" do
    FactoryGirl.create(:user, :user1)
    User.last.email.should eql('user1@gmail.com')
  end
end

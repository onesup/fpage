require 'spec_helper'

describe Token do
  it "이 없는 사용자가 auth를 받으면 Token 생성" do
    auth = FactoryGirl.build(:auth)
    user = FactoryGirl.create(:user, :user_without_token)
    Token.create_or_update_token!(user, auth)
    expect(user.token.access_token).to eql("123")
  end
  
  it "이 있는 사용자가 auth를 받으면 Token 업데이트" do
    auth = FactoryGirl.build(:auth)
    user = FactoryGirl.create(:user, :user_with_token)
    expect(user.token.access_token).to eql("this_is_exist_token")
    Token.create_or_update_token!(user, auth)
    expect(user.token.access_token).to eql("123")
  end
  
end

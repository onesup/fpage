require 'spec_helper'

describe Token do
  auth = FactoryGirl.build(:auth)
  
  it "이 없는 사용자가 auth를 받으면 Token 생성" do
    user = FactoryGirl.create(:user, :user_without_token)
    Token.create_or_update_token!(user, "this_is_token")
    # expect(user.token.access_token).to eql("this_is_token")
  end
  
  it "이 있는 사용자가 auth를 받으면 Token 업데이트" do
    user = FactoryGirl.create(:user, :user_with_token)
    expect(user.token.access_token).to eql("this_is_exist_token")
    Token.create_or_update_token!(user, "this_is_token")
    expect(user.token.access_token).to eql("this_is_token")
  end
  
  it "에 대한 polymorphic 설정이 됨" do
    t = Token.create
    expect(t.identifiable).to eql(nil)
  end
  
  # it "정보 가져오기" do
  #   user_token = FactoryGirl.build(:test_token)[:user]
  #   
  #   expect(token.get_info).to be_a_kind_of(Hash)
  # end
  
end

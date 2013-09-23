require 'spec_helper'

describe Page do
  it "목록을 가져온다. user 토큰을 받아서." do
    user_token = FactoryGirl.build(:test_token)[:user]
    page_uid = FactoryGirl.build(:test_token)[:page_uid]
    Page.create_or_update_page_list(user_token)
    Page.create_or_update_page_list(user_token)
    #한 user가 두 번 목록을 가져와도 중복으로 등록되지 않을 것.
    expect(Page.where(uid: page_uid).count).to eql(1) 
    expect(Page.count).to be >= 1
  end
end

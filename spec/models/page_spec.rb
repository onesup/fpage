require 'spec_helper'

describe Page do
  it "목록을 가져와서 저장한다. user 토큰을 받아서." do
    user_token = FactoryGirl.build(:test_token)[:user]
    page_id = FactoryGirl.build(:test_token)[:page_uid]
    page_ids = Page.create_or_update_page_list(user_token)
    Page.create_or_update_page_list(user_token)
    #한 user가 두 번 목록을 가져와도 중복으로 등록되지 않을 것.
    expect(Page.where(uid: page_id).count).to eql(1) 
    expect(Page.count).to be >= 1
    expect(page_ids).to be_a_kind_of(Array)
  end
end

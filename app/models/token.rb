class Token < ActiveRecord::Base
  belongs_to :identifiable, polymorphic: true
  serialize :data
  
  def self.get_data(access_token)
    api = Koala::Facebook::API.new(access_token)
    api.api("/debug_token", {:input_token => access_token}) 
  end
  
  def self.create_or_update_token!(object, access_token)
    token = object.token
    unless token
      token = Token.new
      token.access_token = access_token
      token.data = Token.get_data(access_token)["data"]
      token.save
    else
      token.access_token = access_token
      token.data = Token.get_data(access_token)["data"]
      token.save
    end
  end
  
end

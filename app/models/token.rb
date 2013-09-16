class Token < ActiveRecord::Base
  belongs_to :user
  
  def self.create_or_update_token!(_user, auth)
    token = _user.token
    unless token
      _user.create_token!(
        :access_token => auth[:credentials][:token]
      )
    else
      token.update_attribute(:access_token, auth[:credentials][:token])
    end
    puts "@@@@"
    puts auth[:credentials]
    puts auth[:credentials][:token]
    puts token.access_token
  end
  
end

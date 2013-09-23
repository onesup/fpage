class Token < ActiveRecord::Base
  belongs_to :identifiable, polymorphic: true
  
  def self.create_or_update_token!(_user, auth)
    token = _user.token
    unless token
      _user.create_token!(
        :access_token => auth[:credentials][:token]
      )
    else
      token.update_attributes!(access_token: auth[:credentials][:token])
    end
  end
  
end

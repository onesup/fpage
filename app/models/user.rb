class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  has_one :token
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, 
  :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    Token.create_or_update_token!(user, auth)
    user
  end
  
end

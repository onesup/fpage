class Page < ActiveRecord::Base
  has_one :token, as: :identifiable
  validates :uid, uniqueness: true
  validates :uid, presence: true
  
  def hello
    puts "Hello"
  end

  def self.hello
    puts "Hello"
  end
  
  def self.create_or_update_page_list(user_token)
    graph = Koala::Facebook::API.new(user_token)
    pages = graph.get_connection('me', 'accounts')
    pages.each do |p|
      if exists?(uid: p["id"]).nil?
        Page.create!(
          uid: p["id"],
          name: p["name"]
        ) 
      else
        find_by_uid(p["id"]).update!(
          name: p["name"]
        )
      end
    end
  end
  
end

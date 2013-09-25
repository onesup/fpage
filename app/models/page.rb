require 'futuroscope/convenience'

class Page < ActiveRecord::Base
  has_one :token, as: :identifiable
  validates :uid, uniqueness: true
  validates :uid, presence: true
  serialize :location
  serialize :cover
  serialize :picture
  serialize :category_list
  serialize :hours
  serialize :global_brand_parent_page
  
  def self.fetch_page_list(user_token)
    graph = Koala::Facebook::API.new(user_token)
    pages = graph.get_connection('me', 'accounts')
    page_ids = Array.new
    pages.each{|page| page_ids << page["id"]}
    page_objects = Array.new
    fields = "name, link, category_list, is_published, can_post, likes, location, phone, checkins, picture, 
      cover, website, description, unread_message_count, unread_notif_count, unseen_message_count, about, 
      description_html, talking_about_count, global_brand_parent_page, access_token, hours"
    page_ids.each do |page_id|
      page_objects << future{ graph.get_object(page_id,{"fields" => fields}) }
    end
    page_objects
  end
  
  def self.create_or_update_page_list(user_token)
    page_objects = Page.fetch_page_list(user_token)
    page_objects.each do |page_object|
      page_id = page_object["id"]
      page_object["uid"] = page_object["id"]
      access_token = page_object["access_token"]
      if exists?(uid: page_id).nil?
        page = Page.create!(page_object) 
      else
        page = find_by_uid(page_id).update!(page_object)
      end
      if page.class == Page
        Token.create_or_update_token!(page, access_token)
      end
    end
    
  end
  
end

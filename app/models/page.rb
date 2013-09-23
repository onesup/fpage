class Page < ActiveRecord::Base
  has_one :token, as: :identifiable
  validates :uid, uniqueness: true
  validates :uid, presence: true
  serialize :location
  serialize :cover
    
  def self.create_or_update_page_list(user_token)
    graph = Koala::Facebook::API.new(user_token)
    pages = graph.get_connection('me', 'accounts')
    page_ids = Array.new
    pages.each{|page| page_ids << page["id"]}
    page_ids.each do |page_id|
      page_object = future { graph.get_object(page_id, {"fields" => "name, link, category_list, is_published, can_post, 
                                      likes, location, phone, checkins, picture, cover, website, 
                                      talking_about_count, global_brand_parent_page, access_token, hours"}) }
      if exists?(uid: page_id).nil?
        Page.create!(
          uid: page_id,
          name: page_object["name"],
          picture: page_object["picture"]["data"]["url"],
          cover: page_object["cover"],
          link: page_object["link"],
          category_list: page_object["category_list"],
          is_published: page_object["is_published"],
          can_post: page_object["can_post"],
          likes: page_object["likes"],
          location: page_object["location"],
          phone: page_object["phone"],
          checkins: page_object["checkins"],
          website: page_object["website"],
          talking_about_count: page_object["talking_about_count"],
          global_brand_parent_page: page_object["global_brand_parent_page"],
          access_token: page_object["access_token"],
          hours: page_object["hours"]
        ) 
      else
        find_by_uid(page_id).update!(
          name: page_object["name"],
          picture: page_object["picture"]["data"]["url"],
          name: page_object["name"],
          picture: page_object["picture"]["data"]["url"],
          cover: page_object["cover"],
          link: page_object["link"],
          category_list: page_object["category_list"],
          is_published: page_object["is_published"],
          can_post: page_object["can_post"],
          likes: page_object["likes"],
          location: page_object["location"],
          phone: page_object["phone"],
          checkins: page_object["checkins"],
          website: page_object["website"],
          talking_about_count: page_object["talking_about_count"],
          global_brand_parent_page: page_object["global_brand_parent_page"],
          access_token: page_object["access_token"],
          hours: page_object["hours"]
        )
      end
    end
    page_ids
  end
  
end

class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :uid
      t.string :name
      t.string :link
      t.string :phone
      t.string :website
      t.string :access_token
      t.string :description
      t.string :description_html
      t.string :about
      t.text :category_list
      t.text :picture
      t.text :location
      t.text :cover
      t.text :hours
      t.text :global_brand_parent_page
      t.boolean :is_published
      t.boolean :can_post
      t.integer :likes
      t.integer :checkins
      t.integer :talking_about_count
      t.integer :unread_message_count
      t.integer :unread_notif_count
      t.integer :unseen_message_count
      t.timestamps
    end
  end
end

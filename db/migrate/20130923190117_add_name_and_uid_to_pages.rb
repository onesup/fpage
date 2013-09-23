class AddNameAndUidToPages < ActiveRecord::Migration
  def change
    add_column :pages, :uid, :string
    add_column :pages, :name, :string
    add_column :pages, :link, :string
    add_column :pages, :category_list, :string
    add_column :pages, :is_published, :string
    add_column :pages, :can_post, :string
    add_column :pages, :likes, :string
    add_column :pages, :location, :string
    add_column :pages, :phone, :string
    add_column :pages, :checkins, :string
    add_column :pages, :picture, :string
    add_column :pages, :cover, :string
    add_column :pages, :website, :string
    add_column :pages, :talking_about_count, :string
    add_column :pages, :global_brand_parent_page, :string
    add_column :pages, :access_token, :string
    add_column :pages, :hours, :string
  end
end

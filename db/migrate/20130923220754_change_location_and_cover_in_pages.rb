class ChangeLocationAndCoverInPages < ActiveRecord::Migration
  def change
    change_column :pages, :location, :text
    change_column :pages, :cover, :text
    change_column :pages, :hours, :text
    change_column :pages, :global_brand_parent_page, :text
    change_column :pages, :is_published, :boolean
    change_column :pages, :can_post, :boolean
    change_column :pages, :likes, :integer
    change_column :pages, :checkins, :integer
    change_column :pages, :talking_about_count, :integer
  end
end

class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :access_token
      t.integer :user_id
      t.text :data
      t.timestamps
    end
  end
end

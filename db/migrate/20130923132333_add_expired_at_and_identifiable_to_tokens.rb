class AddExpiredAtAndIdentifiableToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :expired_at, :datetime
    add_reference :tokens, :identifiable, index: true, polymorphic: true
  end
end

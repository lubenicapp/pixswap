class AddTokenRevisionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token_revision, :integer, default: 0
  end
end

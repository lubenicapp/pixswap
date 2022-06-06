class AddTokenRevisionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token_revision, :string
  end
end

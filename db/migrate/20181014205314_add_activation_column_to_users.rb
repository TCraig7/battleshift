class AddActivationColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :api_key, :string
  end
end

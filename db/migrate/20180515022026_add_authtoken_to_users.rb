class AddAuthtokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Authtoken, :string
  end
end

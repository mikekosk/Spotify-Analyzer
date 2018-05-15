class AddAccountidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Accountid, :string
  end
end

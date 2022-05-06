class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :text
    add_column :users, :mobile, :integer
  end
end

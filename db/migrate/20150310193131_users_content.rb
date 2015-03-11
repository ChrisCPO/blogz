class UsersContent < ActiveRecord::Migration
  def change
    add_column :users, :twitter_handel, :string
    add_column :users, :github_handel, :string
  end
end

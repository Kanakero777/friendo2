class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :facebook_image, :string
    add_column :users, :name, :string
  end
end

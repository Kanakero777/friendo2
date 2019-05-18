class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :name, :string
    add_column :users, :birthday, :integer
    add_column :users, :sex, :string
    add_column :users, :homeCountry, :string
    add_column :users, :nativeLanguage, :string
    add_column :users, :newLanguage, :string
    add_column :users,:languageLevel, :string
    add_column :users,:job, :string
    add_column :users,:residence, :string
    add_column :users,:introduction,:text
    add_column :users,:like, :string
  end
end

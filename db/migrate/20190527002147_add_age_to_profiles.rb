class AddAgeToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :age, :string
  end
end

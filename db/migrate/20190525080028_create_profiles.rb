class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :image
      t.string :name
      t.string :birthday
      t.string :sex
      t.string :homeCountry
      t.string :nativeLanguage
      t.string :newLanguage
      t.string :languageLevel
      t.string :job
      t.string :residence
      t.text :introduction
      t.string :hobby
      t.integer :user_id
      t.timestamps
    end
  end
end

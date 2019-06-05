class CreateOthers < ActiveRecord::Migration[5.2]
  def change
    create_table :others do |t|
      t.string        :name
      t.string        :sex
      t.string        :age
      t.string        :homeCountry
      t.string        :nativeLanguage
      t.string        :residence
      t.timestamps
    end
  end
end

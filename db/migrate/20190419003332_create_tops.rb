class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.text:body
      t.timestamps
    end
  end
end

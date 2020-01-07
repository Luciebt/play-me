class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end

class AddCityToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :city, :string
  end
end

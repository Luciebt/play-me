class AddCategoryToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :category, :integer, null: false
  end
end

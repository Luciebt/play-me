class AddCategoryToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :category, :string
  end
end

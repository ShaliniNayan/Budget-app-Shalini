class AddCategoryIdToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_id, :integer
    add_index :categories, :category_id
  end
end

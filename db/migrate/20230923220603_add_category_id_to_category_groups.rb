class AddCategoryIdToCategoryGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :category_groups, :group_id, :integer
    add_index :category_groups, :group_id
  end
end

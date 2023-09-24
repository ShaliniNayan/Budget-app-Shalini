class CreateJoinTableCategoriesCategoryGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :groups do |t|
      # t.index [:category_id, :group_id]
      # t.index [:group_id, :category_id]
    end
  end
end

class AddIconToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :icon, :string
  end
end

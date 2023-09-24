class CategoryGroupsController < ApplicationController
  def save_cat_group(category)
    group_id = params[:group_id]
    @category_group = CategoryGroup.create!(
      category_id: category.id,
      group_id:
    )
  end
end

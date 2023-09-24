class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      category_group = CategoryGroup.find(params[:category][:group_id])
      @category.category_groups << category_group
      redirect_to user_group_path(current_user.id, params[:category][:group_id]),
                  notice: 'Successfully created Category spending'
    else
      render 'new', alert: 'Category group failed to create'
    end
  end

  private

  def save_cat_group(_category, category_id, group_id)
    @category_group = CategoryGroup.create!(
      category_id:,
      group_id:
    )
  end

  def category_params
    params.require(:category).permit(:name, :amount)
  end
end

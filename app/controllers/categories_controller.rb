class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:public]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @expenses = Expense.all.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

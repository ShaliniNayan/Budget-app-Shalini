class ExpensesController < ApplicationController
  before_action :find_category

  def new
    @expense = @category.expenses.new
  end

  def create
    unless @category.user == current_user
      return redirect_to categories_path, notice: 'You can only create expenses from your categories'
    end

    @expense = @category.expenses.new(expense_params)
    @expense.user = current_user

    if @expense.save
      flash[:notice] = 'Expense created successfully'
      update_category_sum_spent
      redirect_to @category
    else
      flash[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def update_category_sum_spent
    # Update the sum spent for the category after creating a new expense
    @category.update(sum_spent: @category.expenses.sum(:amount))
  end
end

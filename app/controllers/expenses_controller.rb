class ExpensesController < ApplicationController
  before_action :find_category

  def new
    @expense = Expense.new
  end

  def create
    unless @category.user == current_user
      return redirect_to categories_path, notice: 'You can only create expenses from your categories'
    end

    @expense = @category.expenses.build(expense_params)
    @expense.user = current_user

    if @expense.save
      flash[:notice] = 'Expense created successfully'
      redirect_to @category
    else
      flash[:alert] = @expense.errors.full_messages.first if @expense.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount).merge(category_id: @category.id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end

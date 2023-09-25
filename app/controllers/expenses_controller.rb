class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @categories = Category.all.where(user_id: current_user.id)
  end

  def create
    @expense = Expense.create(expense_params)
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save
        format.html do
          redirect_to category_url(Category.find(@expense.category_id)), notice: 'Expense created'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end

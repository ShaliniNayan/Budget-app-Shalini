require 'rails_helper'

RSpec.describe Expense, type: :model do
  test 'should not save expense without name' do
    expense = Expense.new
    assert_not expense.save, 'Saved expense without a name'
  end

  test 'should not save expense without amount' do
    expense = Expense.new(name: 'Test Expense')
    assert_not expense.save, 'Saved expense without an amount'
  end
end

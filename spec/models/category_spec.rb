require 'rails_helper'

RSpec.describe Category, type: :model do
  test 'should not save category without name' do
    category = Category.new
    assert_not category.save, 'Saved category without a name'
  end

  test 'should not save category without icon' do
    category = Category.new(name: 'Test Category')
    assert_not category.save, 'Saved category without an icon'
  end
end

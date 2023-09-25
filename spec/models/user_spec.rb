require 'rails_helper'

RSpec.describe User, type: :model do
  test 'should not save user without name' do
    user = User.new
    assert_not user.save, 'Saved user without a name'
  end
end

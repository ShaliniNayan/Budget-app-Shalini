class Category < ApplicationRecord
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses
  has_many :expenses, after_add: :update_sum_spent, after_remove: :update_sum_spent
  has_one_attached :icon
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  attr_accessor :sum_spent

  validates :name, presence: true
  validates :icon, presence: true

  has_many :expenses, after_add: :update_sum_spent, after_remove: :update_sum_spent

  private

  def update_sum_spent(_expense)
    self.sum_spent = expenses.sum(:amount)
    save
  end
end

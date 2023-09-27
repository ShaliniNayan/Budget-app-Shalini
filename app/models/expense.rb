class Expense < ApplicationRecord
  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

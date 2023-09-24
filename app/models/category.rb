class Category < ApplicationRecord
  has_many :categorygroups, dependent: :destroy
  has_many :groups, through: :categorygroups
  has_and_belongs_to_many :category_groups
  belongs_to :user
  attribute :amount, :integer
  
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
end

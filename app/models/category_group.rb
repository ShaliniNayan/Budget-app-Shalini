class CategoryGroup < ApplicationRecord
  belongs_to :category
  belongs_to :group
  belongs_to :group, foreign_key: 'group_id'
  has_and_belongs_to_many :categories
end

class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_exchange_relations
  has_many :groups, through: :group_exchange_relations
  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_exchange_relations
  has_many :exchanges, through: :group_exchange_relations
  validates :name, presence: true, length: { maximum: 50 }
  has_one_attached :icon
  # postponded upload use shrine
end

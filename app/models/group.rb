class Group < ApplicationRecord
  has_many :user_group
  has_many :users, through: :user_group

  has_many :messages

  validates :name, presence: true
end

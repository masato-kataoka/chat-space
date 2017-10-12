class Group < ApplicationRecord
  has_many :user_group
  has_many :user, through: :user_group

  validates :name, presence: true
end

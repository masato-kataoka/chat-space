class Group < ApplicationRecord
  has_many :user_group
  has_many :user, through: :user_group

  belongs_to :message
  has_many :message

  validates :name, presence: true
end

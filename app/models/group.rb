class Group < ApplicationRecord
  has_many :user_group
  has_many :user, through: :user_group, source: :user
end

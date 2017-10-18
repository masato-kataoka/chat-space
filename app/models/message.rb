class Message < ApplicationRecord
  has_one :group
  belongs_to :group

  has_one :user
  belongs_to :user
end

class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  has_many :requests

  validates :name, presence: true
end

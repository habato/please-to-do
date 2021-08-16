class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, validate: false
  has_many :requests, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[a-z0-9]+\z/i } do
      validates :password
    end
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :requests
end

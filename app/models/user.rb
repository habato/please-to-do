class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: true

    with_options format: { with: /\A[a-z0-9]+\z/i } do
      validates :password
    end
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :requests
  has_many :completions
  has_many :comments

  # フォロー機能に関する記述
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  def follow(other_user)
    relationships.find_or_create_by(followed_id: other_user) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(followed_id: other_user)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end
  # //フォロー機能に関する記述//

  # 検索機能に関する記述
  def self.search(search)
    User.where('nickname LIKE(?)', "%#{search}%") if search != ''
  end
  # //検索機能に関する記述//
end

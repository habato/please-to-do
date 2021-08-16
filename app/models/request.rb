class Request < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  has_one :completion, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :content
  end
end

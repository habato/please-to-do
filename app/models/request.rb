class Request < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  has_one   :completion

  with_options presence: true do
    validates :title
    validates :content
  end
end

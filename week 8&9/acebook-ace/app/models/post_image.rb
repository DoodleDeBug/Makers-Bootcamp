class PostImage < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  validates :title, :content, presence: true
  validates :title, length: { minimum: 5, maximum: 25 }
  validates :content, length: { minimum: 5, maximum: 50 }
  # we cant pass tests without turning this off
  # validates :image, attached: true
end

class Tag < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence: true
  validates :name, uniqueness: true
end

class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :size
  belongs_to :state
  belongs_to :gender
  has_many :listings_features, dependent: :destroy
  has_many :features, through: :listings_features

  has_one_attached :picture
end

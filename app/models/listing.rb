class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :size
  belongs_to :state
  belongs_to :gender
  has_many :listings_features, dependent: :destroy
  has_many :features, through: :listings_features

  # allows one picture upload into listing
  has_one_attached :picture

  # validations - allows valide data save into database
  validates :title, :description, :price, :type, :size, :gender, :suburb, :state, presence: true 
  validates :title, length: {minimum: 4, maximum: 20}
  validates :description, length: {minimum: 4, maximum: 500}
end

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

  # sanitise data with lifecycle hooks 
  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?

  private
  
  # remove whitespace after title
  def remove_whitespace 
    self.title = self.title.strip
    self.suburb = self.suburb.strip
    self.description = self.description.strip
  end

  # convert price in the form into integer
  def convert_price_to_cents 
    self.price = (self.attributes_before_type_cast["price"].to_f * 100).round
  end 

end
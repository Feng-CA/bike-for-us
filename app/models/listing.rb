class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :size
  belongs_to :state
  belongs_to :gender
end

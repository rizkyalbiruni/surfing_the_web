class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  enum :status, { pending: 0, approve: 1, decline: 2 }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

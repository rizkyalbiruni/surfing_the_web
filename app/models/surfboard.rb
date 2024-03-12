class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings
  enum :status, { pending: 0, approve: 1, decline: 2 }
end

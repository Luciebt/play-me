class Instrument < ApplicationRecord
  has_many :bookings, :reviews
  belongs_to :user, :category
end

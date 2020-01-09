class Instrument < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  belongs_to :category

  mount_uploader :photo, PhotoUploader
end

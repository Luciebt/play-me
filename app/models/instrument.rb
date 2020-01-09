class Instrument < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  has_many :reviews
  belongs_to :user
  belongs_to :category

  enum category: [:strings, :keys, :woodwinds, :brass, :percussion]
end

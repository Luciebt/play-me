class Instrument < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  has_many :reviews
  belongs_to :user

  validates :description, length: { maximum: 20 }

  enum category: [:strings, :keys, :woodwinds, :brass, :percussion]
end

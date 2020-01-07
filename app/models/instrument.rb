class Instrument < ApplicationRecord
  has_many :bookings, :reviews
  belongs_to :user

  # CATEGORIES = ['Strings', 'Keys', 'Woodwinds', 'Brass', 'Percusion'].freeze

  def self.categories
    ['Strings', 'Keys', 'Woodwinds', 'Brass', 'Percusion']
  end
end

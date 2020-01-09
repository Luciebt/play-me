class Instrument < ApplicationRecord
  has_many :bookings
  # has_many :reviews
  belongs_to :user

  # CATEGORIES = ['Strings', 'Keys', 'Woodwinds', 'Brass', 'Percusion'].freeze

  # def self.categories
  #   ['Strings', 'Keys', 'Woodwinds', 'Brass', 'Percusion']
  # end
  enum category: [:strings, :keys, :woodwinds, :brass, :percussion]
end

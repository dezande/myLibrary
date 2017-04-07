class Book < ApplicationRecord
  has_many :bookings

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
end

class Booking < ApplicationRecord
    validates :start, :end, :purpose, presence: true
    belongs_to :room
    belongs_to :user
end

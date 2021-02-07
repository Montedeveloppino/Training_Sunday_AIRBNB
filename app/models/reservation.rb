class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  belongs_to :city, optional: true
end
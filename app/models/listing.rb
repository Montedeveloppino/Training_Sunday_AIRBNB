class Listing < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  def overlaping_reservation?(datetime)
    # vérifie dans toutes les réservations du listing s'il y a une réservation qui tombe sur le datetime en entrée
  end

end

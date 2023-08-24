class Address < ApplicationRecord
  belongs_to :contact
  belongs_to :city

  has_one :state, through: :city
end

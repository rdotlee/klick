class Location < ActiveRecord::Base
  validates :description, :name, :address, presence: true
  validates :name, uniqueness: { scope: :address,
    message: "Location already exists at this address" }
  has_many :events
end

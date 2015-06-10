class Kwest < ActiveRecord::Base
  validates :year, :trip, presence: true
  validates :trip, uniqueness: { scope: :year,
    message: "already created for that year" }
  has_many :users
  def trip_name
    self.trip+' - '+self.year.to_s
  end
end

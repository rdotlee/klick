class EventType < ActiveRecord::Base
  validates :description, :name, presence: true
  validates :name, uniqueness: true

  has_many :events
end

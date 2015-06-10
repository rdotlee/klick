class Group < ActiveRecord::Base
  validates :event_id, presence: true

  has_many :registrations
  belongs_to :event
end

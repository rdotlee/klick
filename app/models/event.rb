class Event < ActiveRecord::Base
  validates :description, :event_type_id, :date, :time, :location_id, :group_size, presence: true
 # validates :description, :uniqueness { :scope => [:date, :time, :location_id] , :message => "Event already happening at location at the requested date and time"}
  validates :group_size, numericality: { only_integer: true }

  has_many :groups
  has_many :registrations
  belongs_to :location
  belongs_to :event_type
end

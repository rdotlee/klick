class Registration < ActiveRecord::Base
  #
  validates :user_id, :event_id, presence: true
  validates :user_id, uniqueness: { scope: :event_id,
    message: "User already registered for this event" }

  belongs_to :group
  belongs_to :user
  belongs_to :event
end

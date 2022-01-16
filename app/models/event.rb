class Event < ApplicationRecord
  has_many :attendee_events
  has_many :attendees, through: :attendee_events 

  belongs_to :creator, class_name: "User"
end

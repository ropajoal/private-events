class Event < ApplicationRecord
  has_many :attendee_events
  has_many :attendees, through: :attendee_events 

  belongs_to :creator, class_name: "User"

  def self.past
    Event.where("event_date < ?",Date.today)
  end
  def self.upcomming
    Event.where("event_date >= ?",Date.today)
  end
end

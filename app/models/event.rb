class Event < ApplicationRecord
  has_many :attendee_events, dependent: :destroy
  has_many :attendees, through: :attendee_events 

  belongs_to :creator, class_name: "User"

  scope :past, -> {where("event_date < ?",Date.today)}
  scope :upcomming, -> {where("event_date >= ?",Date.today)}

end

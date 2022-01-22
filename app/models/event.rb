class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendee_events, dependent: :destroy
  has_many :attendees, through: :attendee_events 

  has_many :invitations, dependent: :destroy
  has_many :guests, through: :invitations

  scope :past, -> {where("event_date < ?",Date.today)}
  scope :upcomming, -> {where("event_date >= ?",Date.today)}

end

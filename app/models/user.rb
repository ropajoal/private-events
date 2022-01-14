class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

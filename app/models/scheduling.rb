class Scheduling < ActiveRecord::Base
  validates :room_id, :week_id, :user_id, presence: true 
  validates :day, :hour, presence: true

  belongs_to :room
  belongs_to :week
  belongs_to :user

  scope :for_a_room_and_week, ->(room_id, week_id) do
    where(room_id: room_id, week_id: week_id).includes(:user)
  end

  def self.make(user, room_id, week_id, day, hour)
    where(room_id: room_id, week_id: week_id, day: day, hour: hour)
      .first_or_create(user: user) 
  end
end

class Scheduling < ActiveRecord::Base
  belongs_to :room
  belongs_to :week
  belongs_to :user
end

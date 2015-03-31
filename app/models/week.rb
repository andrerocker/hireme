class Week < ActiveRecord::Base
  validates :number, presence: true
end

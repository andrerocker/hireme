class HomeController < ApplicationController
  before_action :load_or_create, only: :index

  def index
    redirect_to room_week_path(@room.id, @week.id)
  end

  private
    # We dont have cruds for this models, this is here only for PoC proposes
    def load_or_create
      @room = Room.first_or_create(name: "dummy")
      @week = Week.where(number: current_week).first_or_create
    end

    def current_week
      Date.today.strftime("%U")
    end
end

class HomeController < ApplicationController
  def index
    redirect_to room_week_path(1, current_week)
  end

  private
    def current_week
      Date.today.strftime("%U")
    end
end

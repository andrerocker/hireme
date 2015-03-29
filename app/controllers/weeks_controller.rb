class WeeksController < ApplicationController
  before_action :load_dependencies

  def show
    @schedulings = Scheduling.for_a_room_and_week(@room.id, @week.id)
  end

  def schedule
    respond_to do |format|
      format.json do
        user = Scheduling.make(current_user, @room.id, @week.id, params[:day], params[:hour]).user
        render json: { name: user.name }
      end
    end
  end

  private
    def load_dependencies
      @room = Room.find(params[:room_id])
      @week = Week.find(params[:id])
    rescue
      # this can be better, in future we add Room and Week crud :p
      redirect_to root_path
    end
end

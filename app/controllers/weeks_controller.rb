class WeeksController < ApplicationController
  before_action :load_dependencies

  def show
    @schedulings = Scheduling.for_a_room_and_week(@room.id, @week.id)
  end

  def schedule
    respond_to do |format|
      format.json do
        scheduling = Scheduling.make(current_user, @room.id, @week.id, params[:day], params[:hour])
        render json: { name: scheduling.user.name }
      end
    end
  end

  def remove_schedule
    respond_to do |format|
      format.json do
        Scheduling.where(
          user_id: current_user.id,
          room_id: @room.id,
          week_id: @week.id,
          day: params[:day],
          hour: params[:hour]
        ).destroy_all
        render nothing: true, status: 204
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

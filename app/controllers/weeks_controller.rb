class WeeksController < ApplicationController
  before_action :load_or_create

  def show
  end

  def schedule
    Scheduling.create!(room: @room, week: @week, day: params[:day], hour: params[:hour])
    render json: "Yeahh"
  end

  private
    # We dont have cruds for this models, this is here only for PoC proposes
    def load_or_create
      @room = Room.where(id: params[:room_id]).first_or_create(name: "dummy")
      @week = Week.where(number: params[:id]).first_or_create
    end
end

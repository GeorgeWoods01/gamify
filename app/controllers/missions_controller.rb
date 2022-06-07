class MissionsController < ApplicationController
  def index
    @missions = @classroom.missions
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.classroom_id = @classroom.id
    if @mission.save
      redirect_to classroom_missions_path(@classroom)
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])

    if @mission.update(mission_params)
      redirect_to classroom_missions_path(@classroom)
    else
      render :new
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    redirect_to classroom_missions_path(@classroom)
  end

  private

  def mission_params
    params.require(:mission).permit(:name, :description, :coins, :time_length)
  end
end

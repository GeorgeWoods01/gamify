class MissionsController < ApplicationController
  def index
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to "classroom_missions"
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
      redirect_to "classroom_missions"
    else
      render :new
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    redirect_to "classroom_missions"
  end

  private

  def mission_params
    # params.require(:mission).permit(:)
  end
end

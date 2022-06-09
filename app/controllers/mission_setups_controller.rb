class MissionSetupsController < ApplicationController
  def new

  end

  def create
    @mission = Mission.find(params[:mission_id])
    current_user.students.each do |student|
      @mission_setup = MissionSetup.new(student: student)
      @mission_setup.mission = @mission
      @mission_setup.save
    end
    respond_to do |format|
      if @mission_setup.save
        # format.html { redirect_to }
        format.json
      else
        # format.html { render "mission/index" }
      end
    end
  end
end

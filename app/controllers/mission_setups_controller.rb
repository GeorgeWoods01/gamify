class MissionSetupsController < ApplicationController
  def index

    @mission_setups = MissionSetup.where(mission_id: params[:mission_id] )

  end

  def new

  end

  def update_collection
    mission_setups = params[:mission_setups]
    mission_setups.each do |mission_setup|
      data_base_mission_setup = MissionSetup.find(mission_setup[0])
      data_base_mission_setup.completion = mission_setup[1][:completion]
      mission = Mission.find(data_base_mission_setup.mission_id)
      student = Student.find(data_base_mission_setup.student_id)
      student.coins += mission.coins
      student.save
      data_base_mission_setup.save
    end

    redirect_to classroom_missions_path(@classroom)
  end

  def create
    @mission = Mission.find(params[:mission_id])
    if MissionSetup.where(mission_id: @mission).empty?
      current_user.students.each do |student|
        @mission_setup = MissionSetup.new(student: student)
        @mission_setup.mission = @mission
        @mission_setup.completion = true
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
end

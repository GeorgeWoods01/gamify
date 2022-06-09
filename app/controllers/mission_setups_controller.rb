class MissionSetupsController < ApplicationController
  def new

  end

  def create
    current_user.students.each do |student|
      @mission_setup = MissionSetup.new(student: student)
      @mission_setup.mission = Mission.find(params[:mission_id])
      @mission_setup.save
    end

    raise

  end

end

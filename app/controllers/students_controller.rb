class StudentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @classroom = Classroom.find(params[:classroom_id])
  end

  def create
    @student = Student.new(student_params)
    @classroom = Classroom.find(params[:classroom_id])
    @student.classroom = @classroom
    if @student.save
      redirect_to classroom_students_path(@classroom)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @my_missions_completed = []
    @my_missions = MissionSetup.where(student_id: @student.id)
    @my_missions.each do |m|
      if m.completion == true
        @my_missions_completed << Mission.find(m.mission_id)
      end
    end
  end

  def update
    @student = Student.find(params[:id])
    @coins = @student.coins
    if params[:value] == "add"
      @student.update(coins: @coins += 1)
    else
      @student.update(coins: @coins -= 1)
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :coins, :photo)
  end
end

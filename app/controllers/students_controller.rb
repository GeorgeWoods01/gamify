class StudentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to classroom_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :coins)
  end
end

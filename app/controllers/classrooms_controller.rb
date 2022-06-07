class ClassroomsController < ApplicationController
  def show
    @students = Student.all
    @sorted_students = @students.sort_by { |student| student[:coins] }.reverse!
  end
end

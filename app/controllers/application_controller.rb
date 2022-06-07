class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_class


  def find_class
    if current_user
      @classroom = current_user.classroom
    end
  end

end

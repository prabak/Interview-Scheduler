class AppointmentsController < ApplicationController

  before_filter :require_user_session

  def index
    @schedules = Schedule.where("interview_type = ?", current_user.interview_type).all
  end
  
  def update
    if current_user.book_interview(params[:id])
      flash[:notice] = "Intervew is scheduled."
    else
      flash[:error]  = "Can not schedule that slot for an interview."
    end
    redirect_to appointments_path
  end

end

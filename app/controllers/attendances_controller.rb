# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @attendances = Attendaces.all
  end

  #def show
   # @attendances = Attendance.find(params[:id])
  #end
  
  def new
    @attendances = Attendance.new
  end 

  def create
    if params[:commit] == "check-in" 
      checkin
    end 
  end
  def checkin
    @attendance = Attendance.create(atendance_params)
    if @attendances.persisted?
    redirect_to root_path
    end
  end

  #def edit
#  @attendances = Attendance.find(params[:id])
  #end

  #def update
   ############# @attendances = Attendance.find(params[:id])
   ############ if @attendances.update(attendance_params)
      #########redirect_to attendances_path
    #########else
   ########   render :edit, status: :unprocessable_entity
   ####### end 
  ######end

 ##### def destroy
 ####   @attendances = Attendance.find(params[:id])
 ###   @attendances.destroy
  ##  redirect_to attendances_path,
## ##   status: :see_other
  #end
#
  private
  def attendances_params
    params.require(:attendance).permit(:checkin, :checkout, :employee_id)
  end
end

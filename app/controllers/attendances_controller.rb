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
    #if params[:commit] == "check-out"
      #checkout
    #end 
    end
  end
  def checkin
<<<<<<< HEAD
    @attendance = Attendance.create(atendance_params)
=======
    @attendances = Attendance.create(attendances_params.merge(:checkin => Time.now))
>>>>>>> Fix: Checkin works properly with the current time
    if @attendances.persisted?
    redirect_to root_path
    end
  end

  #def checkout
   # @attendance = Attendance.find(params[:id])
    #if @attendances.update(attendances_params.merge(:checkout => Time.now))
    #end
  #end  

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

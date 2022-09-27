# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
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
    if params[:commit] == "check-out"
      checkout
    end 
  
  end

  def checkin
    @attendances = Attendance.create(attendances_params.merge(:checkin => Time.now))
    if @attendances.persisted?
    redirect_to root_path
    end
  end

  def checkout
    @attendances = Attendance.find_by(attendances_params)
    if @attendances.update(attendances_params.merge(:checkout => Time.now))
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

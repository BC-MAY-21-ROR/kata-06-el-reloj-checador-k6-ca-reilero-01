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
    if params[:commit] == "check-out"
      checkout
    end 

  end
  def checkin
<<<<<<< HEAD
<<<<<<< HEAD
    @attendance = Attendance.create(atendance_params)
=======
    @attendances = Attendance.create(attendances_params.merge(:checkin => Time.now))
>>>>>>> Fix: Checkin works properly with the current time
    if @attendances.persisted?
    redirect_to root_path
    end
=======
    @attendances = Attendance.find_by(attendances_params)
    if @attendances.nil? || @attendances.checkin.strftime("%F") == Date.today.strftime("%F") 
      @attendances = Attendance.create(attendances_params.merge(:checkin => Time.now))
      if @attendances.persisted?
        redirect_to root_path
      end
    else
  
      redirect_to root_path, :notice => "Ya hiciste el checkin"
      
    end 
>>>>>>> improve checkin and checkout
  end

  def checkout
    @attendances = Attendance.find_by(attendances_params)
    if @attendances.nil? 
      redirect_to root_path, :notice => "Debes hacer el checkin primero"
    elsif @attendances.checkout.nil?
      if @attendances.update(attendances_params.merge(:checkout => Time.now))
        redirect_to root_path
      end
    else 
      redirect_to root_path, :notice => "Ya hiciste el checkout"
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

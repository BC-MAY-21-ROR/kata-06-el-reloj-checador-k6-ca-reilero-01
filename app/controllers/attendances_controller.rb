# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @attendances = Attendaces.all
  end
  
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

  def set_variables
    @find_attendances = Attendance.find_by(attendances_params)
  end  

  def check_attendance
    set_variables.nil? || set_variables.checkin.strftime("%F") != Date.today.strftime("%F") 

  end  

  def checkin 
    if check_attendance 
      @attendances = Attendance.create(attendances_params.merge(:checkin => Time.now))
      if @attendances.persisted?
        redirect_to root_path, :notice => "Checkin realizado correctamente"
      end
    else
      redirect_to root_path, :notice => "Ya hiciste el checkin"  
    end 
  end

  def checkout
    if set_variables.nil? 
      redirect_to root_path, :notice => "Debes hacer el checkin primero"
    elsif set_variables.checkout.nil?
      if set_variables.update(attendances_params.merge(:checkout => Time.now))
        redirect_to root_path, :notice => "Checkout realizado correctamente"
      end
    else 
      redirect_to root_path, :notice => "Ya hiciste el checkout"
    end
  end  

  private
  def attendances_params
    params.require(:attendance).permit(:checkin, :checkout, :employee_id)
  end
end

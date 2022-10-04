# frozen_string_literal: true

class AttendancesController < ApplicationController

  def index
    @q = Attendance.ransack(params[:q])
    @attendances = @q.result(distinct: true)
    
  end

  def show; end

  def month
    @q = Attendance.ransack(params[:q])
    @attendances = @q.result(distinct: true)
    @asistencias = @q.result.count
  end  

  def average
    @average = Attendance.ransack(params[:q])
    @attendances = @average.result(distinct: true)
  end

  def new
    @attendances = Attendance.new
  end 

  def create
    if params[:commit] == "check-in" 
      if exist_params == true
      checkin
      end
    end
    if params[:commit] == "check-out"
      if exist_params == true
      checkout
      end
    end 
  end

  def exist_params
    begin
      @employee = Employee.find(attendances_params[:employee_id])
      return true
    rescue  => e
      redirect_to root_path, :notice => 'El ID no existe'
    end  
  end  

  def set_variables
    @find_attendances = Attendance.where(attendances_params).last
  end  

  def check_attendance
    set_variables.nil? || set_variables.checkin.strftime("%F") != Time.current.strftime("%F") 
  end  

  def checkin 
    @attendances = Attendance.where(attendances_params).last
    if @attendances.nil? || @attendances.checkin.strftime("%F") != Time.current.strftime("%F")
      @attendances = Attendance.create(attendances_params.merge(:checkin => Time.current))
      if @attendances.persisted?
        redirect_to root_path, :notice => "Checkin realizado correctamente"
      end
    else
      redirect_to root_path, :notice => "Ya hiciste el checkin"  
    end 
  end

  def checkout
    @attendances = Attendance.where(attendances_params).last
    if @attendances.nil? 
      redirect_to root_path, :notice => "Debes hacer el checkin primero"
    elsif @attendances.checkout.nil? || @attendances.checkout.strftime("%F") != Time.current.strftime("%F") 
      if @attendances.update(attendances_params.merge(:checkout => Time.current))
        redirect_to root_path, :notice => "Checkout realizado correctamente"
      end
    else 
      redirect_to root_path, :notice => "Ya hiciste el checkout"
    end
  end


  def filter
    if params[:commit] == "filtrar"
      month
    end
  end

  def filter_average   
    if params[:commit] == "filtrar"
      average
    end
  end
  
  

  private
  def attendances_params
    params.require(:attendance).permit(:checkin, :checkout, :employee_id)
  end
end

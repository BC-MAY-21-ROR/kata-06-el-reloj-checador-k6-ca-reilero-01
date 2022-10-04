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
    @asistencias = @average.result.count

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
    @find_attendances = Attendance.find_by(attendances_params)
  end  

  def check_attendance
    set_variables.nil? || set_variables.checkin.strftime("%F") != Date.today.strftime("%F") 
  end  

  def checkin 
    @attendances = Attendance.find_by(attendances_params)
    if @attendances.nil? || @attendances.checkin.strftime("%F") == Date.today.strftime("%F") 
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


  def filter
    if params[:commit] == "filtrar"
      month
    end
  end

  def filter_average   
    if params[:commit] == "filtrar_2"
      average
    end
  end
  
  

  private
  def attendances_params
    params.require(:attendance).permit(:checkin, :checkout, :employee_id)
  end
end

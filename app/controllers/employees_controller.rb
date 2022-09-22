# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employees = Employee.find(params[:id])
  end
  
  def new
    @employees = Employee.new
  end 

  def create
    @employees = Employee.create(employee_params)
    if @employees.persisted?
      redirect_to employees_path
    end 
  end

  def edit
    @employees = Employee.find(params[:id])
  end

  def update
    @employees= Employee.find(params[:id])
    if @employees.update(employee_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @employees= Employee.find(params[:id])
    @employees.destroy
    redirect_to employees_path,
    status: :see_other
  end

  private
  def employee_params
    params.require(:employee).permit(:name,:email, :position, :private_number, :company_id)
  end
end

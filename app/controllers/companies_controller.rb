# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @companies = Company.find(params[:id])
  end
  
  def new
    @companies = Company.new
  end 

  def create
    @companies = Company.create(company_params)
    if @companies.persisted?
      redirect_to companies_path
    end 
  end

  def edit
    @companies = Company.find(params[:id])
  end

  def update
    @companies.update(company_params)
    if @companies.update company_params
      redirect_to companies_path
    end 
  end

  def delete
    @companies.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name,:address)
  end
end

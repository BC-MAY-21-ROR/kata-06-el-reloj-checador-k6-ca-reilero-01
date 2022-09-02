class CompaniesController < ApplicationController
  def index
    @companys = Company.all
  end
end

# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companys = Company.all
  end
end

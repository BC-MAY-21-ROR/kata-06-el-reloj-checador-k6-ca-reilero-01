# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @attendances = Attendance.all
  end
end

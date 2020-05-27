class Api::V1::JobhomeController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end
end

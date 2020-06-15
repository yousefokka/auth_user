class Api::V1::SubmittingsController < ApplicationController
  before_action :authenticate_with_token!
  before_action :set_job, only: [:show ,:destroy]
  before_action :check_requst, only: [:create ,:destroy]
  before_action :check_company, only: [:Jobapplication]
  #before_action :request_agin, only: [:create]  

  / def all
    @submittings = Submitting.all
    render json: @submittings
  end
 /
  def userapplication
    @submittings = current_user.submittings.all
    render json: @submittings
  end


  def show
    render json: @submitting
  end


  def Jobapplication 
  # @submittings= Submitting.joins(job: :users).where(jobs:{job_id: id})
    @submittings = current_job.submittings.all
    render json: @submittings
  end

  def create
    @submitting = current_user.submittings.build(submitting_params)
  
    if @submitting.save
      render json: @submitting, status: 201
    else
      render json: { errors: @submitting.errors }, status: 422
    end
  end

  def destroy
     @Submitting.destroy
   end
  
  
  private
  
    def submitting_params
      params.require(:submitting).permit(:user_id, :job_id)
    end

    def check_requst
      @user = current_user
      render json: {massage: "not authorize user you are not employee"}, status: 401 if @user.user_type != "employee"
    end


  def check_company
    @job = current_job
    render json: {massage: "not authorize company dont allow"}, status: 401 if User.ids == @job.user_id
  end

  def request_agin 
    render json: {massage: "you cant do it again"}, status: 400 if User.ids != @submitting.user_id
  end
    



end

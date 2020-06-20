class Api::V1::JobresponsesController < ApplicationController
  before_action :authenticate_with_token!

  def show 
    jobresponse = current_submition.jobresponse
    return render json: {massage: "Response not found"}, status: 404 unless jobresponse
    render json: jobresponse
  end

  def create
    @jobresponse = current_submition.jobresponse.build(jobresponse_params)
      
    if @jobresponse.save
      render json: @jobresponse, status: 201
    else
      render json: { errors: @jobresponse.errors }, status: 422
    end
  end

  private
  
  def jobresponse_params
    params.require(:jobresponse).permit(:submitting_id, :status)
  end

  def check_requst
    @user = current_user
    render json: {massage: "not authorize user"}, status: 401 if @user.user_type != "ideamaker"
  end
    
end

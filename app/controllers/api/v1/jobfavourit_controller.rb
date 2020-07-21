class Api::V1::JobfavouritController < ApplicationController
    before_action :authenticate_with_token!
    before_action :set_job, only: [:show ,:destroy]
    before_action :check_requst, only: [:create ,:destroy]
    before_action :request_agin, only: [:create]  

    def index   
        @jobs = Job.all 
        @jobfavourits = current_user.jobfavourits.all
        render json: @jobfavourits.as_json(include: :job)
    end


    def show
        render json: @jobfavourit.as_json(include: :job)
    end
    
    
    def create
        @jobfavourits = current_user.jobfavourits.build(favourit_params)
      
        if @jobfavourits.save
          render json: @jobfavourits, status: 201
        else
          render json: { errors: @jobfavourits.errors }, status: 422
        end
    end

      def destroy
        @Submitting.destroy
      end

      private
  
      def favourit_params
        params.require(:jobfavourit).permit(:job_id)
      end

      def check_requst
        @user = current_user
        render json: {massage: "not authorize user you are not employee"}, status: 401 if @user.user_type != "employee"
      end
  

      def add_agin 
        @jobfavourit =Jobfavourit.find_by("user_id = ? and job_id = ?", params[:user_id], params[:job_id])
        render json: {massage: "you cant do it again"}, status: 400 if @jobfavourit
      end

      def set_job
        @jobfavourit= current_user.jobs.find(params[:id])
      end

end

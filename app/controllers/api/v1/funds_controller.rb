class Api::V1::FundsController < ApplicationController
    before_action :authenticate_with_token!
    before_action :set_job, only: [:show ,:destroy]
    before_action :check_requst, only: [:create ,:destroy]
    before_action :check_company, only: [:Jobapplication]
    #before_action :request_agin, only: [:create]  
  
    / def all
      @funds = fund.all
      render json: @funds
    end
   /
    def sponserapplication
      @funds = current_user.funds.all
      render json: @funds
    end
  
  
    def show
      render json: @fund
    end
  
  
    def Ideaapplication 
    # @funds= fund.joins(job: :users).where(jobs:{job_id: id})
      @funds = current_job.funds.all
      render json: @funds
    end
  
    def create
      @fund = current_user.funds.build(fund_params)
    
      if @fund.save
        render json: @fund, status: 201
      else
        render json: { errors: @fund.errors }, status: 422
      end
    end
  
    def destroy
       @fund.destroy
     end
    
    
    private
    
      def fund_params
        params.require(:fund).permit(:user_id, :job_id)
      end
  
      def check_requst
        @user = current_user
        render json: {massage: "not authorize user you are not employee"}, status: 401 if @user.user_type != "sponser"
      end
  
  
    def check_company
      @job = current_job
      render json: {massage: "not authorize company dont allow"}, status: 401 if User.ids == @job.user_id
    end
  
    def request_agin 
      render json: {massage: "you cant do it again"}, status: 400 if User.ids != @fund.user_id
    end
      
end
class Api::V1::JobsearchController < ApplicationController


    def show 
        @jobs = Job.where("title = ? OR address = ?" , params[:address])
        if @jobs.present?
            render json: @jobs , status: 200
        else
            render json: {massage: "not found this Job"}, status: 402
        end
    end


end

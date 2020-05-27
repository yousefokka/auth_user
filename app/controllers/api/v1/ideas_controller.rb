class Api::V1::IdeasController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /ideas
  def index
    @ideas = current_user.ideas.all

    render json: @ideas
  end

  # GET /ideas/1
  def show
    render json: @idea
  end

  # POST /jobs
  def create
    @idea = current_user.ideas.build(idea_params)

    if @idea.save
      render json: @idea, status: :created
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(job_params)
      render json: @idea
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = current_user.jobs.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.require(:idea).permit(:title, :Management, :ideacatagory, :address, :funding, :ideaDescription)
    end
end
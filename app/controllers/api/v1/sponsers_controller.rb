class Api::V1::SponsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_sponser, only: [:show, :update, :destroy]

  # GET /sponsers
  def index
    @sponsers = current_user.sponsers.all

    render json: @sponsers
  end

  # GET /sponsers/1
  def show
    render json: @sponser
  end

  # POST /sponsers
  def create
    @sponser = current_user.sponsers.build(sponser_params)

    if @sponser.save
      render json: @sponser, status: :created, location: @sponser
    else
      render json: @sponser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sponsers/1
  def update
    if @sponser.update(sponser_params)
      render json: @sponser
    else
      render json: @sponser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sponsers/1
  def destroy
    @sponser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponser
      @sponser = current_user.sponsers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponser_params
      params.require(:sponser).permit(:name, :Address, :Catagory, :Gander, :Funding, :Typemanagment, :phone)
    end
end

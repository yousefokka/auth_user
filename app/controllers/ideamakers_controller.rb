class IdeamakersController < ApplicationController
  before_action :set_ideamaker, only: [:show, :update, :destroy]
  basdaa
  # GET /ideamakers
  def index
    @ideamakers = Ideamaker.all

    render json: @ideamakers
  end

  # GET /ideamakers/1
  def show
    render json: @ideamaker
  end

  # POST /ideamakers
  def create
    @ideamaker = Ideamaker.new(ideamaker_params)

    if @ideamaker.save
      render json: @ideamaker, status: :created, location: @ideamaker
    else
      render json: @ideamaker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideamakers/1
  def update
    if @ideamaker.update(ideamaker_params)
      render json: @ideamaker
    else
      render json: @ideamaker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ideamakers/1
  def destroy
    @ideamaker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ideamaker
      @ideamaker = Ideamaker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ideamaker_params
      params.require(:ideamaker).permit(:name, :jobtitle, :addree, :location, :Gander, :qualifiction, :mobile, :interstingfield, :indestry)
    end
end

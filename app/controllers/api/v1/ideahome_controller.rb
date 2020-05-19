class Api::V1::IdeahomeController < ApplicationController
  def index
    def index
      @ideas = Idea.all
      render json: @ideas
    end
  end
end

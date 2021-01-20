class Api::V1::QuestionsController < ApplicationController
  def index
    @question = Question.all.includes([:answers])

    render json: @question
  end

  def show
    @question = Question.find(params[:id])

    render json: @question
  end
end

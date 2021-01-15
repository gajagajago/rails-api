class Api::V1::BooksController < ApplicationController
  def index
    @book = Book.all.includes([:ratings]) # reduce N+1 queries

    render json: @book
  end

  def show
    @book = Book.find(params[:id])

    if @book
      render json: @book
    else
      json_response("Book with id: #{params[:id]} does not exist", false, {}, :not_found)
    end
  end
end

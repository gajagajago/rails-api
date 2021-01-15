class Api::V1::BooksController < ApplicationController
  def index
    @book = Book.all
    json_response("list of all books", true, { books: @book }, :ok)
  end

  def show
    @book = Book.find(params[:id])

    if @book
      rating_avg = @book.ratings.average(:rating).to_f
      json_response("book info", true, { book: @book, rating_avg: rating_avg }, :ok)
    else
      json_response("no match", false, {}, 404)
    end
  end
end

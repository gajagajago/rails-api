class Api::V1::RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.book_id = params[:book_id]

    if @rating.save
      json_response("Rating successful", true, { rating: @rating }, :ok)
    else
      json_response("Rating fail", false, {}, :bad_request)
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:title, :rating)
  end
end

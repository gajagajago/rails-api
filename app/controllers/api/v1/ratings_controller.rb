class Api::V1::RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user

    if @rating.save
      json_response("rating successful", true, { rating: @rating }, :ok)
    else
      json_response("rating fail", false, {}, 401)
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:title, :rating, :book_id)
  end
end

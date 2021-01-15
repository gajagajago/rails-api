class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image, :rating_avg

  has_many :ratings

  def rating_avg
    object.ratings.average(:rating).to_f
  end

  class RatingSerializer < ActiveModel::Serializer
    attributes :id, :title, :rating, :user_id
  end
end

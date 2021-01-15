class Book < ApplicationRecord
  has_many :ratings, dependent: :destroy
end

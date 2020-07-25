class Recommend < ApplicationRecord

    attachment :recommend_image
    belongs_to :user
	belongs_to :genre
	belongs_to :station
end

class Genre < ApplicationRecord

	has_many :shop
	has_many :recommend
	validates :genre_name, presence: true
end

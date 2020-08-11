class Station < ApplicationRecord

	has_many :shop
	has_many :recommend
	validates :station_name, presence: true
end

class Station < ApplicationRecord

	has_many :shop
	has_many :recommend
end

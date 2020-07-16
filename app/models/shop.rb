class Shop < ApplicationRecord

	attachment :main
	belongs_to :genre
	belongs_to :station
	has_many :shop_comments
	has_many :shop_images, dependent: :destroy
	accepts_attachments_for :shop_images, attachment: :image


end

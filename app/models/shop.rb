class Shop < ApplicationRecord

	attachment :main
	belongs_to :genre
	belongs_to :station
	has_many :shop_comments
	has_many :shop_images, dependent: :destroy
	has_many :favorites, dependent: :destroy
	accepts_attachments_for :shop_images, attachment: :image
	geocoded_by :shop_address
	after_validation :geocode, if: :shop_address_changed?

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

end

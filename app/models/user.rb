class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :shop_comments
  has_many :recommend
  has_many :favorites, dependent: :destroy
  # has_many :fovorite_shops, through: :favorites, class_name: "Shop"
  acts_as_paranoid
end

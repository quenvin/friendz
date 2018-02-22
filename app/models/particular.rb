class Particular < ApplicationRecord

    # devise :database_authenticatable, :registerable,
    #      :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user

  mount_uploader :image, PhotoUploader


end

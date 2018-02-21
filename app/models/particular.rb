class Particular < ApplicationRecord

    # devise :database_authenticatable, :registerable,
    #      :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user


end

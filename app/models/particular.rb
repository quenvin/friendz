class Particular < ApplicationRecord

    # devise :database_authenticatable, :registerable,
    #      :recoverable, :rememberable, :trackable, :validatable

  validates :name, uniqueness: true
  validates :age, presence: true
  validates :gender, uniqueness: true
  validates :introduction, presence: true

  belongs_to :user


end

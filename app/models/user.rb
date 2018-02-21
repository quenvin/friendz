class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :posts
<<<<<<< HEAD
  has_one :particular
=======
  has_many :likes
>>>>>>> 20b4170ee0480936f7a656d88562be464c80a774



    # validates_uniqueness_of :username, :case_sensitive => false
    # validates_uniqueness_of :email, :case_sensitive => false





end
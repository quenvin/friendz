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

  has_many :posts ,dependent: :destroy
  has_one :particular
  has_many :likes
  has_many :active_relationships, foreign_key: "follower_id" , class_name: "Relationship" , dependent: :destroy
  has_many :passive_relationships, foreign_key: "follower_id" ,class_name: "Relationship" , dependent: :destroy

  has_many :followings, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower



  #follow another user.
  def follow(other)
    active_relationships.create(following_id: other.id)
  end
  
  #unfollow another user
  def unfollow(other)
    active_relationships.find_by(following_id: other.id).destroy
  end

  # is following a user?
  def following?(other)
    followings.include?(other)
  end
  
    # validates_uniqueness_of :username, :case_sensitive => false
    # validates_uniqueness_of :email, :case_sensitive => false
    def self.search(search)

      where("username ILIKE ?", "%#{search}%") 
    end

end
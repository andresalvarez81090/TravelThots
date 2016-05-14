class User < ActiveRecord::Base
	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_many :places
  has_many :comments
  has_many :likes
  has_many :photos

  acts_as_followable
  acts_as_follower
  acts_as_liker
  acts_as_mentionable
  acts_as_mentioner
 

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end

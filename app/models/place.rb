class Place < ActiveRecord::Base
	belongs_to :user
	validates :city, presence: true
	validates :country, presence: true
	validates :rating, presence: true
	validates :tips, presence: true
end

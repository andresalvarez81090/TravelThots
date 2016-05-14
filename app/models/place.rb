class Place < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos



	acts_as_likeable

	geocoded_by :full_place
	after_validation :geocode 

	validates :city, presence: true
	validates :country, presence: true
	validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5  }
	validates :tips, presence: true

	def full_place
		[city, state, country].compact.join(', ')
	end
end

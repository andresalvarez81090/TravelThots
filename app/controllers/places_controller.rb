class PlacesController < ApplicationController
	def index
		@places = Place.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params)
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:city, :state, :country, :rating, :tips)
	end
end

class PlacesController < ApplicationController
	def index
		@places = Place.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
	end

	def new
		@place = Place.new
	end
end

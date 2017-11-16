class TixesController < ApplicationController

	def index
		@tixes = Tix.all 
	end

	
end

class ApplicationController < ActionController::Base
	def index
		@prompt
		
		render 'home/index'
	end
end

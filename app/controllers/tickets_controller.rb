class TicketsController < ApplicationController

	def index
		@tickets = current_user.tickets
	end

	def show
	end

	def new
	end

	def create
	end

	def mark_as_used
	end

	def destroy
	end

end
	
class TicketsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :find_ticket, only: [:show, :mark_as_used, :destroy]

	
	def index
		if current_user.admin?
			@tickets = Ticket.order('created_at DESC')
		else
			@tickets = current_user.tickets
		end
	end

	def show
		unless @ticket
			render text: "page not found", status: 404
		end
	end

	def new
		@ticket = Ticket.new
	end

	def mark_as_used
		@ticket.use_ticket!
		redirect_to tickets_path
	end

	def create
		@ticket = Ticket.create({user_id: current_user.id}.merge(ticket_params))
		if @ticket.errors.empty?
			redirect_to @ticket
		else
			render 'new'	
		end		
	end

	def destroy
		if current_user.admin?
			@ticket.destroy
			redirect_to tickets_path
		end
	end

	private

		def find_ticket
			@ticket = Ticket.where(id: params[:id]).includes(:event).first
		end
	
		def ticket_params
			params.require(:ticket).permit(:event_id, :row, :seat)
		end

end
	
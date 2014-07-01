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
		@ticket = Ticket.new(event_id: params[:event_id]) 
		render(text: "page not found", satus: 404) and return unless @ticket.event
	end

	def mark_as_used
		@ticket.use_ticket!
		respond_to do |format|
			format.html { redirect_to tickets_path }
			format.json { render json: { status: "ok" } }
		end
	end

	def create
		@ticket = Ticket.create(ticket_params.merge({user_id: current_user.id}))
		if @ticket.errors.empty?
			redirect_to @ticket
		else
			p @ticket.errors
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
	
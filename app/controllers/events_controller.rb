class EventsController < ApplicationController

	def index #/events/ GET
		@events = Event.all
	end

	def show #/events/1/	GET
		@event = Event.find(params[:id])
	end

	def new #/events/new GET
	end

	def create #/events/ POST	
		@event = Event.create(event_params)
		p @event.errors
		if @event.errors.empty?
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit #/events/1/edit/ GET
	end

	def update #/events/1/ PATCH
	end

	def destroy #/events/1/ DELETE
	end

	private
	
	 def event_params
   		params.require(:event).permit(:title, :description, :place_id, :scheduled_at_date, :scheduled_at_time)
   end

end

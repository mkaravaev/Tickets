class EventsController < ApplicationController

	before_filter :find_event, only: [:show, :edit, :update, :destroy]
	
	def index #/events/ GET
		@events = Event.all
	end

	def show #/events/1/	GET
		unless @event
			render text: "page not found", status: 404
		end
	end

	def new #/events/new GET
		@event = Event.new
		unless @event.errors.empty?
			@event.save
		end
	end

	def create #/events/ POST	
		@event = Event.create(event_params)
		if @event.errors.empty?
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit #/events/1/edit/ GET
	end

	def update #/events/1/ PATCH
		@event.update_attributes(event_params)
		if @event.errors.empty?
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy #/events/1/ DELETE
		@event.destroy
		redirect_to events_path
	end

	private

		def find_event
			@event = Event.where(id: params[:id]).first
		end
	
		def event_params
			params.require(:event).permit(:title, :description, :place_id,
			 															:scheduled_at_time)
		end
	
	end

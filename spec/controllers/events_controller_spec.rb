require 'spec_helper'

describe EventsController do

	describe "create action" do 
		it "redirects to event's page if validations pass" do
			post :create, {event: {
						 title: "Filip Kirkorov concert",
						 description: "DryGOY show", 
						 place_id: "2",
						 scheduled_at_date: "2014-12-12",
						 scheduled_at_time: "23:45"
						} }
			response.should redirect_to(assigns(:event))
		end

		it "renders form again if validations fail" do
			post :create, {event: {title: nil} }
			response.should render_template :new
		end
	end

	describe "show action" do
		it "show event with percise number" do
			get :show, {event: {id: 1} }
			response.should redirect_to(assigns(:event))
		end

		it "renders index page if event doesn't exist" do
		end
	end
end

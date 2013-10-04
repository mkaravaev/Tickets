require 'spec_helper'

describe EventsController do

	describe "index action" do
		it "renders all events" do
			event = FactoryGirl.create(:event)
			get :index
			expect(assigns(:events)).to eq([event])
		end
	end

	describe "show action" do 
		it "renders event page" do
			event = FactoryGirl.create(:event)
			get :show, { id: event.id } 
			expect(response).to render_template("show")
		end 

		it "renders 404 page when event not found" do
			get :show, { id: 0 }
			expect(response.status).to eq(404)
		end
	end

	describe "new action" do 
		it "renders new event page" do
			get :new, {event: {
					 title: "Filip Kirkorov concert",
					 description: "DryGOY show", 
					 place_id: "2",
					 scheduled_at_date: "2014-12-12",
					 scheduled_at_time: "23:45"
					} }
			expect(response).to render_template ('new')
		end
	end

	describe "create action" do 
		it "redirects to event's page if validations pass" do
			post :create, { event: {
						 title: "Filip Kirkorov concert",
						 description: "DryGOY show", 
						 place_id: "2",
						 scheduled_at_date: "2014-12-12",
						 scheduled_at_time: "23:45"
						} }
			expect(response).to redirect_to(event_path(assigns(:event)))
		end

		it "renders form again if validations fail" do
			post :create, event: { title: nil }
			expect(response).to render_template("new")
		end
	end


	describe "update action" do 
		it "updates event attributes" do
			pending("add id: event: id to patch")
			event = create(:event)
			event.update_attributes(title: "Alla Pugacheva",
															description: "Hello World")
			patch :update, event: {title: event.title,
															description: event.description
															} #, id: event.id
			expect(response).to eq([event])
		end
	end

	describe "edit action" do 
		it "renders page with edit form" do
			get :new, { event: { title: "Filip Kirkorov concert",
													 description: "DryGOY show", 
													 place_id: "2",
													 scheduled_at_date: "2014-12-12",
													 scheduled_at_time: "23:45"
														} }
			expect(response).to render_template('new')
		end
	end

	describe "destroy action" do 
		it "destroys event" do
			event = create(:event)
			delete :destroy, {id: event.id}
			expect(response).to redirect_to(events_path)
		end
	end

end

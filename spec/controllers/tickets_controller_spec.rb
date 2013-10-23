require 'spec_helper'

describe TicketsController do

	before(:each) do 
		sign_in(@user = create(:user))
	end

	describe "index action" do 

		it "shows all user tickets, if user is not admin" do
			sign_in @user
			tickets = create_list(:ticket, 4, user: @user)
			wrong_tickets = create_list(:ticket, 2)
			get :index
			expect(assigns(:tickets)).to include(*tickets)
			expect(assigns(:tickets)).not_to include(*wrong_tickets)
		end

		it "shows 403 page if user doesn't login" do

			tickets = create_list(:ticket, 4, user: @user)
			wrong_tickets = create_list(:ticket, 2)
			get :index
			expect(response.status).to redirect_to(new_user_session_path)
		end
		
		it "shows all tickets of all users, if user is admin" do
			sign_in @user
			@user.toggle!(:admin)
			tickets = create_list(:ticket, 4, user: @user)
			all_tickets = @user.tickets.to_a
			get :index
			expect(assigns(:tickets)).to eq(all_tickets)
		end
	end

	describe "show action" do 
		it "renders page with user tickets" do
			ticket = create(:ticket)
			get :show, { id: ticket.id }
			expect(response).to render_template("show")
		end
	end	

	describe "new action" do 
		it "renders new ticket page" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "mark_as_used action" do 
		it "use ticket and redirect to index path" do
			ticket = create(:ticket)
			post :mark_as_used, { id: ticket.id }
			expect(ticket.reload.used).to eq(true)
			expect(response).to redirect_to(tickets_path)
		end
	end

	describe "create action" do
		it "creats new ticket and redirects to new ticket path" do
			post :create,  ticket: {  event_id: "2",
															  seat: "1",
															  row: "1" 
															}												
			expect(response).to redirect_to(ticket_path(assigns(:ticket)))
		end

		it "renders new ticket if ticket was not created" do
			post :create, { ticket: { event_id: nil } }
			expect(response).to render_template('new')
		end
	end

	describe "destroy action" do 
		it "delete ticket" do
			user = create(:user)
			user.toggle!(:admin)
			sign_in user
			ticket = create(:ticket)
			delete :destroy, id: ticket.id
			expect(response).to redirect_to(tickets_path)
		end
	end

end
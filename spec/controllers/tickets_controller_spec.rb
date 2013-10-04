

describe TicketsController do

	describe "index action" do 
		it "shows all user tickets, if user is not admin" do
			user = create(:user)
			sign_in user
			tickets = create_list(:ticket, 4, user: user)
			wrong_tickets = create_list(:ticket, 2)
			get :index
			expect(assigns(:tickets)).to include(*tickets)
			expect(assigns(:tickets)).not_to include(*wrong_tickets)
		end
		
		it "shows all tickets of all users if user is admin" do

		end
	end	
end
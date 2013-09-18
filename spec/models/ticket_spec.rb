require 'spec_helper'

describe Ticket do

  it "generates unique number" do
  	ticket = Ticket.new( user: create(:user) )
  	ticket.send("generate_number")
  	ticket.number.should_not be_blank
  end

  it "searching by first 7 symbols of ticket" do
  	ticket = Ticket.new( ticket: create(:ticket) )
  	ticket.search_ticket_by_number("1234567891011121314").number
 
  end

  it "makes ticket used" do
  	ticket = Ticket.new( user: create(:ticket) )
  	ticket.use_ticket
  	ticket.used.should be true
	end

end
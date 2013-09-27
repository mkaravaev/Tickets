require 'spec_helper'

describe Ticket do

  it "generates unique number" do
  	ticket = Ticket.new(user: create(:user))
  	ticket.send("generate_number")
  	ticket.number.should_not be_blank
  end

  it "searching by some digits of ticket" do
  	ticket = Ticket.new(user: create(:user))
  	ticket.update_attribute(:number, "123456789")
  	Ticket.find_by_number("1234567").first.should == ticket
    Ticket.find_by_number(123).should be_nil
  end

  it "makes ticket used" do
  	ticket = Ticket.new(user: create(:user))
  	ticket.send("generate_number")
  	ticket.send("use_ticket")
  	ticket.used.should be true
	end

end
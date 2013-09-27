class Ticket < ActiveRecord::Base
	
	require 'digest/md5'

	before_validation :generate_number

	validates :number, presence: true, uniqueness: true
	validates :seat, uniqueness: { scope: :row }
	validates :user_id, :event_id, :status, presence: true

	belongs_to :event
	belongs_to :user

	def self.find_by_number(n)
		return nil if n.to_s.length < 7
		ticket = Ticket.where("number LIKE '#{n}%'")	
	end

	
	private

		def generate_number
			write_attribute(:number, Digest::MD5.hexdigest("#{seat} #{row} #{Time.now}"))
		end

		def use_ticket
			update_attribute(:used, "true") if self.used = "false"
		end

end
class ContactsController < ApplicationController

	def new
		# creates a blank contact in the server's memory
		@contact = Contact.new
		
	end

	def create
		
	end
end
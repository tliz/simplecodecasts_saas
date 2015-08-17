class ContactsController < ApplicationController

	def new
		# creates a blank contact in the server's memory
		@contact = Contact.new
		
	end

	def create
		# pass query string parameters
		@contact = Contact.new(contact_params)	

		if @contact.save
			name = params[:contact][:name]
			email = params[:contact][:email]
			body = params[:contact][:comments]

			ContactMailer.contact_email(name, email, body).deliver

			flash[:success] = 'Message Sent'
			redirect_to new_contact_path
		else 
			flash[:danger] = 'Error, occured! Message has not been sent'
			redirect_to new_contact_path
		end	
	end

	private
		# white list attributes  for contact object
		def contact_params
			params.require(:contact).permit(:name, :email, :comments)			
		end

end
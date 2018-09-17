class ContactsController < ApplicationController

	before_action :get_contact

	def index
		@contacts = Contact.order("name asc")
	end

	def new
	end

	def create
		contact = Contact.new(contact_params)
		if contact.save
			redirect_to contacts_path
		else
			flash[:notice] = contact.error.full_message
		end
	end

	def edit
	end

	def update
	end

	private
		def get_contact
			@contact = params[:id].present? ? Contact.find(params[:id]) : Contact.new 
		end

		def contact_params
			params.require(:contact).permit(:first_name, :name, :last_name, :email)
		end

end
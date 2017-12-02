class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
    # Instantiate a new object using form parameters
    @contact = Contact.new(params[:contact])
    @contact.request = request
    @contact.deliver 
    redirect_to new_contact_path, notice: "Your message has been sent successfully. We will reply soon."
#    # Save the object
#    if @contact.deliver
#      # If save succeeds
#      flash.now[:error] = ''
#      flash[:notice] = "Email sent successfully."
#      redirect_to contacts_path
#    else
#      flash.now[:error] = 'Cannot send message.'
#      #render :new
#      redirect_to new_contact_path, :alert => "Fail. Cannot send this message."
#    end
	end

end

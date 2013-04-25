class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
			#sign the user in and redirect to the user's show page.
			sign_in user
			redirect_to user
		else
			# Create an error message and re-render the signin form.
			flash.now[:error] = 'Invalid email/password combination' #not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end

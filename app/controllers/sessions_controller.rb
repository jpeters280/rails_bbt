class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by_email(session_params[:email])

		if user && user.authenticate(session_params[:password])
	      session['id'] = user.id
	      redirect_to "/groups"
		else
	      flash[:errors] = ["Invalid combination"]
	      redirect_to :back
	    end
	end

	
	def destroy
		session.clear
		redirect_to "/"
	end

	private
		def session_params
			params.require(:user).permit(:email, :password)
		end

end

class UsersController < ApplicationController

	def create
  		user = User.new( user_params )
  		if user.valid?
  			user.save
  			new_user = User.find_by_email(user_params[:email])
  			session['id'] = new_user.id
	  		redirect_to "/groups"
	  	else
	  		flash[:errors]=user.errors.full_messages
	  		redirect_to :back
	  	end
	end

	private 
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end
end

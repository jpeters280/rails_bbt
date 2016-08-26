class MembershipsController < ApplicationController

	def create
  		membership = Membership.new( membership_params )
  		if membership.valid?
  			membership.save
	  		redirect_to :back
	  	else
	  		redirect_to '/'
	  	end
	end

	def destroy
  		Membership.find( params[:id] ).destroy
  		redirect_to :back
	end

	private 
		def membership_params
			params.require(:membership).permit(:user_id, :group_id)
		end
end

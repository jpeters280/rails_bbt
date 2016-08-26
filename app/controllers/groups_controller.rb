class GroupsController < ApplicationController
  def index
  	@user= User.find(session['id'])
  	@groups = Group.all
  end
  def show
  	@group = Group.find(params[:id])
  	@member = @group.memberships.where(:user_id=>session['id'])
  	@attendees = @group.memberships
  end
  def create
  	group = Group.new( group_params )
  		if group.valid?
  			group.save
  			register= Group.last
  			Membership.create(:user_id=>session['id'], :group_id=>register['id'])
	  		redirect_to "/groups"
	  	else
	  		flash[:errors]=group.errors.full_messages
	  		redirect_to :back
	  	end
  end

  def destroy
  		@group = Group.find(params[:id])
  	if session['id']== @group.user_id
  		@group.destroy
  		redirect_to "/groups"
  	else
  		redirect_to "/groups"
  	end
  end

  private
  def group_params
			params.require(:group).permit(:org_name, :description, :user_id)
		end
end

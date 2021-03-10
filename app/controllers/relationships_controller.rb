class RelationshipsController < ApplicationController
  def create
    current_user.follow(user)
    redirect_to users_path
  end

  def destroy
    current_user.unfollow(user)
    redirect_to users_path
  end

  protected
  def user
    User.find(params[:relationship][:following_id])
  end
end

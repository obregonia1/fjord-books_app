# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    current_user.follow(user)
    redirect_to user_path(user)
  end

  def destroy
    current_user.unfollow(user)
    redirect_to user_path(user)
  end

  private

  def user
    User.find(params[:relationship][:following_id])
  end
end

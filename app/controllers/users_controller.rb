# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @users = User.order(:id).find(params[:id]).followings.page(params[:page])
  end

  def followers
    @users = User.order(:id).find(params[:id]).followers.page(params[:page])
  end
end

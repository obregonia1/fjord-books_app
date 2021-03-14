# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.text.blank?
      redirect_to @commentable, notice: t('views.common.require_comment')
    else
      @comment.save
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

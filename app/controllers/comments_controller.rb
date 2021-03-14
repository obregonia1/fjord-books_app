# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

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

  def edit; end

  def update
    @comment.update(comment_params)
    redirect_to @comment.commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
  end

  def destroy
    @comment.destroy
    redirect_to @comment.commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end

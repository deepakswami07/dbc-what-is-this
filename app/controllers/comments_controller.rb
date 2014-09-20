class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    response = Response.find(params[:response_id])
    comment = Comment.new(comment_params)

    if comment.save
      response.comments << comment
      redirect_to response.question
    else
      render :new
    end
  end

  def edit
  end

  def update
    response = Response.find(@comment.response_id)
    @comment.update(comment_params)

    redirect_to response.question
  end

  def destroy
    response = Response.find(@comment.response_id)
    @comment.destroy

    redirect_to response.question
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end

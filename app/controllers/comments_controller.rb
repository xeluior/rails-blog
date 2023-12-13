class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:notice] ||= 'Comment added.'
      redirect_to article_path(@article)
    else
      flash[:alert] ||= @comment.errors.full_messages
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :status)
    end
end

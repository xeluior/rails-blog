class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @parent = if params[:article_id]
                Article.find(params[:article_id])
              else
                Comment.find(params[:comment_id])
              end
    @comment = @parent.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:notice] ||= 'Comment added.'
      redirect_to article_path(@comment.root)
    else
      flash[:alert] ||= @comment.errors.full_messages
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    authorize @comment

    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :status)
    end
end

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  after_action :verify_authorized, except: %i[index new create]

  def index
    @articles = if params[:user_id]
                  @user = User.find(params[:user_id])
                  policy_scope(Article).where(author: @user).last 5
                else
                  policy_scope(Article).last 5
                end
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user

    if @article.save
      flash[:notice] = 'Article created.'
      redirect_to @article
    else
      flash[:alert] = @article.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      flash[:notice] = 'Article updated.'
      redirect_to @article
    else
      flash[:alert] = @article.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article

    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end

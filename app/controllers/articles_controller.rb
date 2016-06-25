class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show, :new, :edit, :create, :update, :destroy]

  def index
    @articles = Article.paginate(:page => params[:page], :per_page =>2)
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.friendly.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.friendly.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end
end

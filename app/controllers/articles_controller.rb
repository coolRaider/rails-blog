class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 4)
    authorize! :index, @articles
    respond_to do |format|
      format.html {render :index}
      format.js {}
      format.json {render json: {:articles => @articles}}
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
    authorize! :show, @article
  end

  def new
    @article = Article.new
    authorize! :new, @article
  end

  def edit
    @article = Article.friendly.find(params[:id])
    authorize! :edit, @article
  end

  def create
    @article = Article.create(article_params)
    authorize! :create, @article
    if @article.save
      flash[:success] = "article created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.friendly.find(params[:id])
    authorize! :update, @article
    if @article.update(article_params)
      flash[:success] = "article updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.friendly.find(params[:id])
    authorize! :destroy, @article
    @article.destroy
    flash[:success] = "article destroyed successfully."
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :tag_list, :banner).merge(user_id: current_user.id)
    end
end

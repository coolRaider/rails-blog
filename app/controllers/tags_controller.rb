class TagsController < ApplicationController
  def index
    if params[:q].blank?
      @tags = ActsAsTaggableOn::Tag.all
    else
      @tags = ActsAsTaggableOn::Tag.search(name_cont: params[:q][:term]).result(distinct: true)
    end
    authorize! :index, @tags
    respond_to do |format|
      format.html {render :index}
      format.js {}
      format.json {render json: @tags}
    end
  end

  def show
    @q = Article.ransack(params[:q])
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @articles = @q.result(distinct: true).tagged_with(@tag.name).paginate(:page => params[:page], :per_page => 2)
    authorize! :show, @articles
    respond_to do |format|
      format.html {render "articles/index"}
      format.js {}
      format.json {render json: @articles}
    end
  end
end

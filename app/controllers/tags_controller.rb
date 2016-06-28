class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    authorize! :index, @tags
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @articles = Article.tagged_with(@tag.name).paginate(:page => params[:page], :per_page => 4)
    authorize! :show, @articles
  end
end

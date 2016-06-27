class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    respond_to do |format|
      format.html {render :index}
      format.js {}
      format.json {render json: @tags}
    end
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @articles = Article.tagged_with(@tag.name).paginate(:page => params[:page], :per_page => 4)
  end
end

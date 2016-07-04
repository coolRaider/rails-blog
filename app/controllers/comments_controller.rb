class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  load_and_authorize_resource

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id, commenter: current_user.email)
    end
end

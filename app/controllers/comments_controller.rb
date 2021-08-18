class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
        # article_id id of article(because this id after /article)
        @article = Article.find(params[:article_id])
        @comments = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :commenter, :status)
    end
end

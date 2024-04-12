class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: "Commentaire créé avec succès !"
    else
      redirect_to @post, alert: "Merci de rentrer un commentaire"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class PostCommentsController < ApplicationController
  def create
    post_study = PostStudy.find(params[:post_study_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_study_id = post_study.id
    comment.save
    redirect_to post_study_path(post_study)
  end
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

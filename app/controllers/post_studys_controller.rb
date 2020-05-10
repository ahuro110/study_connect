class PostStudysController < ApplicationController
  def new
    @post_study = PostStudy.new
  end
  def create
    @post_study = PostStudy.new(study_post_params)
    @post_study.user_id = current_user.id
    if @post_study.save
      redirect_to post_study_path(@post_study)
    else
      render "new"
    end
  end
  def show
    @post_study = PostStudy.find(params[:id])
    @post_comment = PostComment.new
  end
  def index
    @post_studies = PostStudy.page(params[:id]).reverse_order
  end
  def edit
    @post_study = PostStudy.find(params[:id])
  end
  def update
    @post_study = PostStudy.find(params[:id])
    if @post_study = PostStudy.update(study_post_params)
      redirect_to post_study_path(@post_study)
    else
      render "edit"
    end
  end
  def destroy
    @post_study = PostStudy.find(params[:id])
    @post_study.destroy
    redirect_to post_studys_path
  end
  private
  def study_post_params
    params.require(:post_study).permit(:date, :content)
  end
end

class FavoritesController < ApplicationController
  def create
    post_study = PostStudy.find(params[:post_study_id])
    favorite = current_user.favorites.new(post_study_id: post_study.id)
    favorite.save
    redirect_to post_study_path(post_study)
  end
  def destroy
    post_study = PostStudy.find(params[:post_study_id])
    favorite = current_user.favorites.find_by(post_study_id: post_study.id)
    favorite.destroy
    redirect_to post_study_path(post_study)
  end
end

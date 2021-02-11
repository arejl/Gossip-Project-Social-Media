class LikesController < ApplicationController
  def create
    if logged_in?
      Like.create(user_id:current_user.id, gossip_id:params[:gossip_id])
      redirect_back(fallback_location: root_path)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    if logged_in?
      @like = current_user.likes.find(params[:id])
      @like.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to new_session_path
    end
  end
end

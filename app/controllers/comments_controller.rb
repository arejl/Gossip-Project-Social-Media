class CommentsController < ApplicationController
  def create
    if session[:user_id]==nil
      redirect_to new_session_path
    else
      @user = User.find(session[:user_id])    
      @comment = Comment.new(content:params[:comment_content], gossip_id:params[:gossip_id], user_id:@user.id)
      if @comment.save
        flash[:success] = "Commentaire ajouté" 
        redirect_to(gossip_path(id:params[:gossip_id]))
      else
        flash[:danger] = "Commentaire non valide"
        redirect_to(gossip_path(id:params[:gossip_id]))
      end
    end
  end

  def new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @@parent_gossip = Comment.find(params[:id]).gossip
    @comment.destroy
    redirect_to @@parent_gossip
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to gossip_path(id:@comment.gossip.id)
    else
      render :edit
    end
  end
end

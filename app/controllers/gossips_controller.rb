class GossipsController < ApplicationController
  def create
    @user = current_user
    @all_tags = Tag.all
    @gossip = Gossip.new(title:params[:title], content:params[:content], user_id:@user.id)
    if @gossip.save
      if !params[:tags].nil?
        params[:tags].each do |tag_id|
          @gossip.tags << Tag.find(tag_id.to_i)
        end
      end
      redirect_to(root_path)
    else
      render :new   
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to(root_path)
  end

  def edit
    @all_tags = Tag.all
    @gossip = Gossip.find(params[:id])
  end

  def new
    if logged_in? == false
      redirect_to new_session_path
    else
      @user = current_user
      @gossip = Gossip.new
      @all_tags = Tag.all
    end
  end

  def update
    @all_tags = Tag.all
    @gossip = Gossip.find(params[:id])
    new_tags = Array.new
    if @gossip.update(title:params[:title], content:params[:content])
      if !params[:tags].nil?
        params[:tags].each do |tag_id|
          new_tags << Tag.find(tag_id.to_i)
        end
      end
      @gossip.tags = new_tags
      redirect_to @gossip
    else
      render :edit
    end
  end

  def show
    @gossip_id = Gossip.find(params[:id].to_i)
  end
end

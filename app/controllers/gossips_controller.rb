class GossipsController < ApplicationController
  def id
    @gossip_id = Gossip.find(params[:id].to_i)
  end
end

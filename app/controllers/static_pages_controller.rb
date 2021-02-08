class StaticPagesController < ApplicationController
  def contact
  end
  def home
    @all_gossips = Gossip.all
  end
  def team
  end
end

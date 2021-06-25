class DashboardController < ApplicationController
  def index
    if logged_in?
      @user       = current_user
      @documents  = @user.documents
      @articles   = @user.articles
      @links      = @user.links
      
      @tags       = Hash.new()
      tag_cloud @documents
      tag_cloud @articles
      tag_cloud @links
    end
  end
  
  def tag_cloud assets
    for asset in assets 
      next if asset.nil? or asset.tags.nil?
        
      for tag in asset.tags
        @tags[tag.name] = 0 if @tags[tag.name].nil?
        @tags[tag.name] += 1
      end
    end
  end
  
end

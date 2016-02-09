class EpicenterController < ApplicationController
  def feed
  	@following_tweets = []

  	Tweet.all.each do |t|
  		if current_user.following.include?(t.user_id)
  			@following_tweets.push(t)
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
    
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end
end

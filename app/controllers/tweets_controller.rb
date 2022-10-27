class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet_new = Tweet.new
    @like_new = Like.new
  
    # Select those tweets belonging to current_user (only if it's logged in). Used to filter those who can be edited or deleted. 
    # Select all for admins 
    # @user_tweets = current_user ? current_user.tweets : [] 
    # @user_tweets = current_user ? policy_scope( Tweet ) : []
    # @user_tweets = policy_scope( Tweet )
    # @user_likes = current_user ? current_user.liked_tweets : []
  end

  def show
    @tweet_got = Tweet.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

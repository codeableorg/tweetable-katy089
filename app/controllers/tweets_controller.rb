class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @tweets = Tweet.all.order(updated_at: :desc).where(replied_to_id: nil)
    @tweet_new = Tweet.new
    @like_new = Like.new

  end

  def show
    @tweet_new = Tweet.new
    @tweet_got = Tweet.find(params[:id])
  end

  def create
    @tweet_new = Tweet.new(tweet_params)
    @tweet_new.user_id = current_user.id
    @tweet_new.save

    redirect_to root_path
  end

  def edit
    @tweet_got = Tweet.find(params[:id])
    authorize @tweet_got
    @tweet_parent = @tweet_got.replied_to
  end

  def update
    @tweet_new = Tweet.find(params[:id])
    authorize @tweet_new
    @tweet_new.update(tweet_params)

    redirect_to root_path
  end

  def destroy
    @tweet_new = Tweet.find(params[:id])
    authorize @tweet_new
    @tweet_new.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :replied_to_id)
  end

end

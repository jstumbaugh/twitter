class Api::V1::TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]

  def index
    @tweets = Tweet.all
    json_response @tweets
  end

  def create
    @tweet = Tweet.create(tweet_params)

    json_response @tweet, :created
  end

  def show
    json_response @tweet
  end

  def destroy
    @tweet.destroy

    head :no_content
  end

  def update
    @tweet.update_attributes(tweet_params)

    json_response @tweet
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:id, :description)
    end
end

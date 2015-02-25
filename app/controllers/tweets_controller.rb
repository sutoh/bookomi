class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :destroy, :tag_create]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.order("created_at DESC").page params[:page]
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  def user
    @tweets = Tweet.where(screen_name: params[:screen_name]).order("created_at DESC").page params[:page]
  end

  # POST /tweets
  # POST /tweets.json
  def create
    build_data = Tweet.build_image(tweet_params)
    @tweet = Tweet.new(build_data)
    @tweet.manga = Manga.new

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweet_id)
    end

    def tag_patams
      params.require(:tag).permit(:name)
    end
end

class AuthorsController < ApplicationController
  before_action :set_author, only: [:show]
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.order("created_at DESC").page params[:page]
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweets = @author.tweets.order("created_at DESC").page params[:page]
  end
  private
    def set_author
      @author = Author.friendly.find(params[:id])
    rescue => e
      @error = '一度も登録されていないAuthorだお (´・ω・｀)'
    end
end

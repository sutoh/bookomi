class MangasController < ApplicationController
  before_action :set_manga, only: [:tag_create]
  # GET /mangas
  # GET /mangas.json
  def index
    @mangas = Manga.all
  end

  # POST /mangas
  # POST /mangas.json
  def tag_create
    #@manga = Manga.new(manga_params)
    respond_to do |format|
      if @manga.save
        format.html { redirect_to @manga, notice: 'Manga was successfully created.' }
      else
        format.html { redirect_to root_path }
      end
    end
  end
  private
    def set_tweet
      @tweet = Manga.find(params[:id])
    end
    def manga_params
      params.require(:manga).permit(:name)
    end
end

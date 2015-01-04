class MangasController < ApplicationController
  before_action :set_manga, only: [:tag_create, :tag]
  # GET /mangas
  # GET /mangas.json
  def index
    @mangas = Manga.all
  end

  def tag
  end

  # POST /mangas
  # POST /mangas.json
  def tag_create
    @manga.tags << Tag.new(tag_params)
    respond_to do |format|
      if @manga.save
        format.json { render :tag }
        format.json { render :tag, status: :created, location: @manga }
      end
    end
  end
  private
    def set_manga
      @manga = Manga.find(params[:id])
    end

    def tag_params
      params.require(:manga).require(:tag).permit(:name)
    end
end

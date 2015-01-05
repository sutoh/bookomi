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
    tag = Tag.find_by(name: tag_params["name"])
    @manga.tags.push tag.blank? ? Tag.new(tag_params) : tag
    respond_to do |format|
      if @manga.save
        format.js { render :tag }
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

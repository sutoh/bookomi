class MangasController < ApplicationController
  before_action :set_manga, only: [:tag_create, :tag, :tag_destroy]
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
    respond_to do |format|
      begin
        @manga.tags.push tag.blank? ? Tag.new(tag_params) : tag
        if @manga.save
          format.json { render :tag, status: :created, location: @manga } 
        end
      rescue => e
        @error = e.to_s
        format.json { render json: @error, status: :unprocessable_entity } 
      end
    end
  end

  # DELETE /mangas/:id/tag_destroy
  def tag_destroy
    tag_id = Tag.friendly.find(params[:tag]).id
    MangaTag.where({
      tag_id: tag_id,
      manga_id: params[:id]}).destroy_all
    render :tag
  end

  private
    def set_manga
      @manga = Manga.find(params[:id])
    end

    def tag_params
      params.require(:manga).require(:tag).permit(:name)
    end
end

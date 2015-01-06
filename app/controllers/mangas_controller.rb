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
    begin
      @manga.tags.push tag.blank? ? Tag.new(tag_params) : tag
      if @manga.save
        render :tag
      end
    rescue => e
      @error = e.to_s
      render :tag_error
    end
  end

  # DELETE /mangas/:id/tag_destroy
  def tag_destroy
    MangaTag.where({
      tag_id: params[:tag],
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

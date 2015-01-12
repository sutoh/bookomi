class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.friendly.find(params[:id])
    rescue => e
      @error = '一度も登録されていないTag (´・ω・｀)'
    end
end

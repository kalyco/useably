class PhotosController < ApplicationController

  def index
    if params[:query]
      @pg_search_result = PgSearch.multisearch(params[:query])
      @photos = []
      @pg_search_result.each do |result|
      @photos << Photo.find(result.searchable_id)
      end
    end
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @tag = Tag.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "you have added a new photo!"
      @tag = Tag.find_or_create_by(tag_params)
      @photo_tag = PhotoTag.find_or_create_by(photo: @photo, tag: @tag)
      redirect_to photos_path
    else
      render :new
    end
  end

  protected

  def photo_params
    params.require(:photo).permit(
      :name, :description, :source, :image_file
    )
  end

  def tag_params
    params.require(:tag).permit(
      :name)
  end
end

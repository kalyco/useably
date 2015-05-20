class PhotosController < ApplicationController

  def index
    if params["search"] == nil
      @photos = Photo.all
    else
      tag = Tag.find_by(name: params["search"])
      photo_tag = PhotoTag.find_by(tag: tag)
      @photos = Photo.where(id: photo_tag.photo_id)
    end
    if @photos == []
      flash[:notice] = "no photos to display"
    end
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

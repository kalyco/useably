class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @mods = User.where(authority: "admin")
    if params["search"] == nil
      @photos = Photo.where(approved: true)
    else
      count = SearchCount.find_or_create_by(title: params["search"])
      count.save_search(params["search"])
      tag = Tag.find_by(name: params["search"])
      photo_tag = PhotoTag.find_or_create_by(tag: tag)
      @photos = Photo.where(id: photo_tag.photo_id)
    end
    @photos.order(created_at: :DESC)
    if @photos == []
      flash[:notice] = "no photos to display"
    end
  end

  def show
    @photo = Photo.find_by(id: params["id"])
  end

  def new
    @photo = Photo.new
    @tag = Tag.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save && current_user.has_authority?
      flash[:notice] = "you have added a new photo"
    elsif @photo.save
      flash[:notice] = "your photo has been submitted for review"
      @tag = Tag.find_or_create_by(tag_params)
      @photo_tag = PhotoTag.find_or_create_by(photo: @photo, tag: @tag)
      redirect_to photos_path
    else
      flash[:notice] = "error adding photo"
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

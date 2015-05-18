class TagsController < ApplicationController

  def new
    binding.pry
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
  end

  protected

  def tag_params
    require(:tag).permit(:photo, :name)
  end
end

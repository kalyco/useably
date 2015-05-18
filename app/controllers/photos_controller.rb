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
end

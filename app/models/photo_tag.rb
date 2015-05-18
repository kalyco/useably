class PhotoTag < ActiveRecord::Base
  belongs_to :photos
  belongs_to :tags

  validates_presence_of :photo
  validates_presence_of :tags
end

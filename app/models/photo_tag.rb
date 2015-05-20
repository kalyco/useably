class PhotoTag < ActiveRecord::Base
  belongs_to :photo
  belongs_to :tag

  validates_presence_of :photo
  validates_presence_of :tag
end

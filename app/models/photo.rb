class Photo < ActiveRecord::Base
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  belongs_to :user
  belongs_to :album
  mount_uploader :image_file, AvatarUploader

  validates_presence_of :name
end

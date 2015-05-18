class Photo < ActiveRecord::Base
  include PgSearch
  multisearchable against: :tag
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  belongs_to :user
  belongs_to :album

  validates_presence_of :name
  validates_presence_of :image_url
end

class Tag < ActiveRecord::Base
  include PgSearch
  multisearchable against: :name
  has_many :photo_tags
  has_many :photos, through: :photo_tags

end

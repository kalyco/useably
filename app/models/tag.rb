class Tag < ActiveRecord::Base
  # include PgSearch
  # multisearchable against: :tag
  has_many :photo_tags
  has_many :photos, through: :photo_tags

  validates :name, presence: true, uniqueness: true
end

class Tag < ActiveRecord::Base
  include PgSearch
  multisearchable against: :tag
  has_one :photo_tag

  validates :name, presence: true, uniqueness: true
end

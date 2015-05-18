class Tag < ActiveRecord::Base
  has_one :photo_tag

  validates :name, presence: true, uniqueness: true
end

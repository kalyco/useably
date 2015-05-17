class MetaTag < ActiveRecord::Base
  belongs_to :photos

  validates_presence_of :name
end

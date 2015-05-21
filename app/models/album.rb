class Album < ActiceRecord::Base
  has_many :photos
  belongs_to :user

end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :search_counts
  has_many :photos
  has_many :albums
  has_many :favorite_photos
  has_many :favorites, through: :favorite_photos, source: :photo

  def has_authority?
    authority == "admin"
  end

  def tag_list
    @list = SearchCount.where(user: self)
    if @list != []
      @list.sort_by { |list| list.count }
      tags = []
      0.upto(15) do
        tags << @list.title.pop
      end
    tags
    end
  end
end

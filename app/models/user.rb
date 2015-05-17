class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :photos, :albums

  def has_auth?
    authority == "admin"
  end
end

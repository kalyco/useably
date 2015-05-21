class SearchCount < ActiveRecord::Base
  belongs_to :user

  def save_search(search)
    self.count += 1
  end
end

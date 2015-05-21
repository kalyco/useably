class SearchCount < ActiveRecord::Base

  def save_search(search)
    self.count += 1
  end
end

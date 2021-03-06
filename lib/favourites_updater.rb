class FavouritesUpdater
  def self.call(marked_as_favourites, current_page_numbers, saved_favourites)
    updates = { new_favourites: [], deleted_favourites: [] }
    currently_displayed_favourites = saved_favourites & current_page_numbers

    if marked_as_favourites.nil? and currently_displayed_favourites.size > 0
      updates[:deleted_favourites] = currently_displayed_favourites
    elsif marked_as_favourites.nil? and currently_displayed_favourites.empty? 
      updates[:deleted_favourites] = [] 
      updates[:new_favourites] = []
    else
      marked = marked_as_favourites.map{ |n| n.to_i }
      updates[:deleted_favourites] = (currently_displayed_favourites - marked)
      updates[:new_favourites] = (marked - saved_favourites)
    end
    updates
  end
end

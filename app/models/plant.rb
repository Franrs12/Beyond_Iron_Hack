class Plant < ActiveRecord::Base

	def self.search search
		if search
    	where('common_name LIKE ?', "%#{search}%")
  	else
	    all
  	end
  end
end

# http://railscasts.com/episodes/240-search-sort-paginate-with-ajax?autoplay=true
# http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true
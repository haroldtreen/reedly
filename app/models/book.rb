class Book < ActiveRecord::Base

	def links_arr
		links.split(';')
	end
end

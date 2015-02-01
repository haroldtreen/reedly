class User < ActiveRecord::Base

	def feeds_arr
		feeds.split(';')
	end

end

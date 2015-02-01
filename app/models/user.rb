class User < ActiveRecord::Base

	has_many :books

	def feeds_arr
		feeds.split(';')
	end

end

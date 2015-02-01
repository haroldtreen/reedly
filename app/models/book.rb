require 'kindlegen'

class Book < ActiveRecord::Base
	belongs_to :user

	def links_arr
		links.split(';')
	end

	def epub_path
		filepath
	end

	def mobi_path
		mobi = filepath.gsub(/\.epub/, '.mobi')
		unless File.exists?(mobi)
			Kindlegen.run(filepath, "-o", File.basename(mobi))
		end
		mobi
	end
end

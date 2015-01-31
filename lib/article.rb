class Article
	attr_accessor :link
	attr_accessor :title
	attr_accessor :content

	def initialize(options = {})
		@link = options[:link]
		@title = options[:title]
		@content = options[:content]
	end
end
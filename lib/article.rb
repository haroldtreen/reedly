require 'reverse_markdown'

class Article
	attr_accessor :link
	attr_accessor :title
	attr_accessor :content

	def initialize(options = {})
		@link = options[:link]
		@title = options[:title]
		@content = options[:content]
	end

	def to_html
		"<h1>#{title}</h1>\n" + content
	end

	def to_markdown
		ReverseMarkdown.convert to_html
	end

	def filename
		"#{title.gsub(/[^0-9A-Za-z.\-]/, '_')}.md"
	end

	def markdown_path(base_path)
		base_path + '/' + filename
	end
end
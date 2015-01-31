require 'rubygems'
require 'readability'
require 'open-uri'

class Reedler
	def self.generate(book)
		source = open(url).read
		Readability::Document.new(source, :tags => %w[div p img a h1 h2], :attributes => %w[src href], :remove_empty_nodes => false).content
	end

	def self.to_articles(book)
		
	end
end
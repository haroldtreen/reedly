require 'rubygems'
require 'readability'
require 'open-uri'

class Reedler
	TEMP_PATH = File.join(Rails.root, 'tmp', 'books')

	def self.to_epub(book)
		book.save
		articles = to_articles(book)
		epub_path = compile_epub(book, articles)
		FileUtils.mv(epub_path, File.join(Rails.root, 'books', book.id.to_s + ".epub",))
		FileUtils.rm_rf(File.join(TEMP_PATH, book.id.to_s))
	end

	def self.to_articles(book)
		articles = []
		book.links_arr.each do |link|
			articles << to_article(link)
		end
		articles
	end

	def self.to_article(link)
		source = open(link).read
		doc = Readability::Document.new(source, :tags => %w[div p h1 h2], :attributes => %w[src href])

		Article.new(title: doc.title, content: doc.content, link: link)
	end

	def self.save_to_markdowns(articles, base_path)
		articles.each do |article|
			save_to_markdown(article, base_path)
		end
	end

	def self.save_to_markdown(article, base_path)
		file = File.new(article.markdown_path(base_path), 'w')
		file.puts(article.to_markdown)
		file.close
	end

	def self.compile_epub(book, articles)
		tmp_path = "#{TEMP_PATH}/#{book.id.to_s}"
		FileUtils.mkdir_p(tmp_path)
		Dir.chdir tmp_path

		save_to_markdowns(articles, tmp_path)

		create_config({title: book.title, author: 'Reedly', toc: true, max_level: 1 })
		`rpub compile`

		Dir.glob('*.epub').first
	end

	def self.create_config(options)
		file = File.new('config.yml', 'w')
		file.puts(options.to_yaml)
		file.close
	end
end
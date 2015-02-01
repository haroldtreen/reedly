require 'rails_helper'

describe Article do
	it 'has a link' do
		link = "www.google.com"
		article = Article.new(link: link)
		expect(article.link).to eq(link)
	end

	it 'has a title' do
		title = 'Article!'
		article = Article.new(title: title)
		expect(article.title).to eq(title)
	end

	it 'has content' do
		content = "<h1>Content</h1>"
		article = Article.new(content: content)
		expect(article.content).to eq(content)
	end

	it 'outputs html' do
		article = Article.new(content: "<body><p>Body</p></body>", title: "Title")
		expect(article.to_html).to eq("<h1>Title</h1>\n<body><p>Body</p></body>")
	end

	it 'creates a path' do
		article = Article.new(title: "Title")
		expect(article.markdown_path("/base")).to eq("/base/Title.md")
	end
end
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
end
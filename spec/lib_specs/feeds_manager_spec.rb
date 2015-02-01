require 'rails_helper'

describe FeedsManager do
	before :all do
		@feed_urls = ["http://www.theverge.com/rss/index.xml", "http://rss.cbc.ca/lineup/topstories.xml", "http://queensjournal.ca/rss/latest/"]
		@feeds = FeedsManager.get_feeds(@feed_urls)
		
	end

	it 'formats feed data' do
		formatted_feeds = FeedsManager.format_feed_data(@feeds)
		expect(formatted_feeds.class).to be(Hash)
	end

	it 'gets feeds' do
		expect(@feeds.length).to eq(3)
		expect(@feeds.first.link).to eq('http://www.theverge.com/')
	end
end
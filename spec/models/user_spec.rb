require 'rails_helper'

describe User, :type => :model do
	before :all do
		@user = User.create(name: "Harold", email: "haroldtreen@kindle.com", feeds: "http://www.theverge.com/rss/index.xml;http://rss.cbc.ca/lineup/topstories.xml;http://queensjournal.ca/rss/latest/")
	end

	it 'provides the URL feeds' do
		feeds = ["http://www.theverge.com/rss/index.xml", "http://rss.cbc.ca/lineup/topstories.xml", "http://queensjournal.ca/rss/latest/"]
		expect(@user.feeds_arr).to eq(feeds)
	end
end

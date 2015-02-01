class FeedsManager

	def self.get_feeds(feed_urls)
		feeds = []
		feed_urls.each do |f|
			feeds << get_feed(f)
		end
		feeds
	end

	def self.get_feed(feed_url)
		SimpleRSS.parse open(feed_url)
	end

	def self.format_feed_data(feeds)
		formatted_data = {}

		feeds.each do |f|
			formatted_data[f.channel.title] = f.items.map do |i| 
				summary =  i.summary
				summary ||= i.content
				summary ||= i.description
				summary.force_encoding('UTF-8')
				summary = Nokogiri::HTML(summary).text
				i.title = i.title.force_encoding('UTF-8') if i.title
				{ title: i.title, summary: summary, link: i.link }
			end
		end
		formatted_data
	end
end
require 'rails_helper'

describe ReedlyConverter do
	it 'converts content' do
		converter = ReedlyConverter.new()
		converter.convert('http://www.cbc.ca/news/politics/stephen-harper-takes-aim-at-terror-opposition-gets-dinged-1.2938587')

	end
end
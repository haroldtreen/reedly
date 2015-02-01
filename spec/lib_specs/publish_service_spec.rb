require 'rails_helper'

describe PublishService do

	before :all do
		@user = User.create(name: "Harold Treen", email: "haroldtreen@kindle.com")
		@book = Book.create(title: "FirstBook", description: "This is my first book!", user_id: @user.id, links: "http://www.cbc.ca/news/canada/ottawa/shots-fired-in-carlington-area-should-lead-to-charges-police-say-1.2939073;http://www.cbc.ca/news/canada/british-columbia/b-c-orcas-rare-beach-rubbing-behaviour-caught-on-video-1.2939355")
	end

	it 'pushes ebooks' do
		Reedler.to_epub(@book)
		#expect(BookMailer).any_instance.to receive(:send_to_kindle)
		PublishService.send_to_kindle(@book)

	end
end
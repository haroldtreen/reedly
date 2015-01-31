require 'rails_helper'

describe Reedler do
	before :all do
		@book = Book.create(title: "First Book", description: "Description", links: "www.g.c;www.e.c;www.t.c")
	end

	describe '#to_articles' do
		it 'returns an array of articles' do
			uri_mock = double("uri_mock")
			html = "<title>G.C</title><body><p>This is a text body!!!</p></body>"

			expect(Reedler).to receive(:open).and_return(uri_mock).exactly(3).times
			expect(uri_mock).to receive(:read).and_return(html).exactly(3).times
			
			articles = Reedler.to_articles(@book)
			expect(articles.length).to be(3)
			expect(articles.first.link).to eq('www.g.c')
		end
	end

	describe '#to_epub' do
		it 'generates an epub' do
			#book = Book.create(title: "Third Book", description: "My book", links: "http://www.cbc.ca/news/canada/british-columbia/mother-swept-away-in-puntledge-river-near-courtenay-b-c-dies-1.2939187;http://www.cbc.ca/news/canada/montreal/hamza-chaoui-s-islamic-community-centre-won-t-get-permit-1.2939069")

			#Reedler.to_epub(book)
		end
	end
end
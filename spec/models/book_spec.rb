require 'rails_helper'

describe Book, :type => :model do
	before :all do
		@book = Book.create(title: "First Book", description: "Description", links: "www.g.c;www.e.c;www.t.c")
	end

	it{ expect(@book).to respond_to('title') }
	it{ expect(@book).to respond_to('description') }
	it{ expect(@book).to respond_to('links') }

	it 'parses its links' do
		expect(@book.links_arr).to eq(['www.g.c', 'www.e.c', 'www.t.c'])
	end
end

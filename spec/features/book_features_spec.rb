require 'rails_helper'

describe 'Book' do
	it 'has no books' do
		visit '/books'
		expect(page).to have_content "No books on this bookshelf"
	end
	# it 'should have a title' do
	# 	book = Book.create title: 'Ruby for Dummies'
	# 	expect(book.title).to eq 'Ruby for Dummies'
	# end
end
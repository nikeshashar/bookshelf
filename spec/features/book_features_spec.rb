require 'rails_helper'

describe 'Book Page' do
	it 'has no books' do
		visit '/books'
		expect(page).to have_content "No books on this bookshelf"
	end
	
  it "has a book" do    
    book = Book.create title: 'Rails for Dummies'
    visit '/books' 
    expect(page).to have_content 'Rails for Dummies'
  end

end
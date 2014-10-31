require "rails_helper"

describe "Book Page" do
	it "has no books" do
		visit books_path
		expect(page).to have_content "No books on this bookshelf"
	end
	
  it "has a book" do    
    book = Book.create title: "Rails for Dummies"
    visit books_path 
    expect(page).to have_content "Rails for Dummies"
  end

  it "has multiple books" do
    book = Book.create title: "Rails for Dummies"
  	book2 = Book.create title: "Javascript for Dummies"
  	visit books_path
  	expect(page).to have_content "Rails for Dummies"
  	expect(page).to have_content "Javascript for Dummies"
  end

  it "can add a book to the shelf using a form" do
  	visit books_path
  	click_link 'Add a book'
  	within '.book-form' do
  		fill_in "Title", with: "Rails for Dummies"
  		click_button "Add book"
  	end
  	expect(current_path).to eq books_path
  	expect(page).to have_content "Rails for Dummies"
  end

end
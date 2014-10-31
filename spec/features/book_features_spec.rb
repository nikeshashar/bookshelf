require "rails_helper"

describe "Book Page" do

  context 'without books' do 
    it "has no books" do
      visit books_path
      expect(page).to have_content "No books on this bookshelf"
    end
  end
  
  context 'with books' do 
    before  do 
      @book = create(:book)
      @book2 = create(:book2)
      visit books_path 
    end 

    it "has a book" do    
      expect(page).to have_content "Rails for Dummies"
    end

    it "has multiple books" do
      expect(page).to have_content "Rails for Dummies"
      expect(page).to have_content "Javascript for Dummies"
    end

    it "can add a book to the shelf using a form" do
      click_link 'Add a book'
      within '.book-form' do
        fill_in "Title", with: "Rails for Dummies"
        click_button "Add book"
      end
      expect(current_path).to eq books_path
      expect(page).to have_content "Rails for Dummies"
    end

    it "hides no books notice when there is a book" do
      expect(page).not_to have_content "No books on this bookshelf"
    end
  end
end
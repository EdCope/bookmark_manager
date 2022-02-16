require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

			conn = PG.connect( dbname: 'bookmark_manager_test' ) 

      # Add the test data
      Bookmark.add('http://www.makersacademy.com')
      Bookmark.add("http://www.google.com")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
    end

  end

  describe '#add' do
    it "adds to the list" do
      Bookmark.add("http://www.myspace.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.myspace.com")
    end
  end
end
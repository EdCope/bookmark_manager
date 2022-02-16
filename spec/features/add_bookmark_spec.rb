feature "Add Bookmark" do
  scenario "displays a new bookmark on the page" do
    visit('/bookmarks')
    fill_in("url", with: "http://www.myspace.com")
    click_button("Add")
    expect(page).to have_content("http://www.myspace.com")
  end
end

require 'rails_helper'

RSpec.feature 'Books', type: :feature do

  scenario 'create' do
    visit new_book_path

    fill_in 'book[name]', with: 'book1'
    fill_in 'book[price]', with: '1500'
    fill_in 'book[release_date]', with: '2019/05/15'

    expect{
      click_on 'commit'
    }.to change{ Book.count }.by 1

    expect(page).to have_content 'Book was successfully created.'
  end

end

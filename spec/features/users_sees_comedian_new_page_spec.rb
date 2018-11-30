RSpec.describe 'Comedian New Page' do
  context 'As a visitor' do
    it 'shows a form to input a new comedian, that form works, then redirects to /comedians ' do

      visit '/comedians/new'

      fill_in 'Name', with: 'James'
      fill_in 'Age', with: '4'
      fill_in 'City', with: 'Jamestown'

      click_on 'Submit'
      save_and_open_page

      expect(page).to have_content('James')
      expect(page).to have_content(4)
      expect(page).to have_content('Jamestown')

      expect(current_path).to eq('/comedians')

    end
  end
end

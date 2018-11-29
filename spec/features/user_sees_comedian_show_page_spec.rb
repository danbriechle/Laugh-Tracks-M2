RSpec.describe 'Comedian Show Page' do
  context 'As a visitor' do
    it 'shows comedian list with name, age and city' do
      ben = Comedian.create(name: 'ben', age: 27, city: "denver")
      dave = Comedian.create(name: 'dave', age: 40, city: "new york")

      visit '/comedians'

      save_and_open_page
      within "#comic-#{ben.id}" do
        expect(page).to have_content(ben.name)
        expect(page).to have_content("age - #{ben.age}")
        expect(page).to have_content(ben.city)
      end
      within "#comic-#{dave.id}" do 
        expect(page).to have_content(dave.name)
        expect(page).to have_content("age - #{dave.age}")
        expect(page).to have_content(dave.city)
      end
    end

    # it 'shows comedian list with specials names' do
    #   ben = Comedian.create(name: 'ben', age: 27, city: "denver")
    #   dave = Comedian.create(name: 'dave', age: 40, city: "new york")
    #
    #   visit '/comedians'
  end
end

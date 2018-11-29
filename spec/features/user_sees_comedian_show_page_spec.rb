RSpec.describe 'Comedian Show Page' do
  context 'As a visitor' do
    it 'shows comedian list with name, age and city' do
      ben = Comedian.create(name: 'ben', age: 27, city: "denver")
      dave = Comedian.create(name: 'dave', age: 40, city: "new york")

      visit '/comedians'

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

    it 'shows comedian list with specials names' do
     daves_special = Special.create(name: "daves really funny")
     dave = Comedian.create(name: 'dave', age: 40, city: "new york")
     daves_special.comedians << Comedian.find_by(name: "dave")

     bens_special = Special.create(name: "bens really funny")
     dave = Comedian.create(name: 'ben', age: 27, city: "denver")
     bens_special.comedians << Comedian.find_by(name: "ben")

      visit '/comedians'
      
      within "#comic-#{ben.id}" do
        expect(page).to have_content(ben.specials)
      end

      within "#comic-#{dave.id}" do
        expect(page).to have_content(dave.specials)
      end
    end
  end
end

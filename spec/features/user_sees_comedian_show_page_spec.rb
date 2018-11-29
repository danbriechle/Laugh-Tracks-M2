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
     dave = Comedian.create(name: 'dave', age: 40, city: "new york") #a comedian is a play list
     dave.specials.create(name: "daves really funny")
     ben = Comedian.create(name: 'ben', age: 27, city: "denver")
     ben.specials.create(name: "bens really funny")

      visit '/comedians'

      within "#comic-#{ben.id}" do
        expect(page).to have_content("bens really funny")
      end

      within "#comic-#{dave.id}" do
        expect(page).to have_content("daves really funny")
      end
    end

    it 'shows a comedians specials run time length and thumbnail image' do
     dave = Comedian.create(name: 'dave', age: 40, city: "new york") #a comedian is a play list
     davesspecial = dave.specials.create(name: "daves really funny", runtime: 12, img: "../../app/public/image/dave.png")

     visit '/comedians'

     within "#comic-#{dave.id}" do
       expect(page).to have_css("img[src='#{davesspecial.img}']")
       expect(page).to have_content(davesspecial.runtime)
     end
   end

 end
end

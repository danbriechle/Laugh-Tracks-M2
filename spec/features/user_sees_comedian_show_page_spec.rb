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

    it 'shows a statistics area with avg age, avg runtime & unique cities list' do
      dave = Comedian.create(name: 'dave', age: 40, city: "New York") #a comedian is a play list
      dave.specials.create(name: "daves really funny", runtime: 20, img: "../../app/public/image/dave.png")

      john = Comedian.create(name: 'john', age: 20, city: "Denver") #a comedian is a play list
      john.specials.create(name: "john is not funny", runtime: 10, img: "../../app/public/image/john.png")

      visit '/comedians'

      within ".statistics" do
        expect(page).to have_content("Average Age 30")
        expect(page).to have_content("Average Runtime 15")
        expect(page).to have_content("New York", "Denver")
      end
    end

    it 'can be querried for a list of all comedians by age' do
      dave = Comedian.create(name: 'dave', age: 40, city: "new york")
      ben = Comedian.create(name: 'ben', age: 27, city: "denver")

      visit '/comedians?age=40'

      expect(page).to have_content(dave.name)
      expect(page).not_to have_content(ben.name)
    end

    it 'shows a count of all the specials in the stats section and each comedian has a total specials count'do
    dave = Comedian.create(name: 'dave', age: 40, city: "New York")
    dave.specials.create(name: "daves really funny", runtime: 20, img: "../../app/public/image/dave.png")

    john = Comedian.create(name: 'john', age: 20, city: "Denver")
    john.specials.create(name: "john is not funny", runtime: 10, img: "../../app/public/image/john.png")

    visit '/comedians'

      within "#comic-#{john.id}" do
        expect(page).to have_content("Total Specials: 1")
      end

      within ".statistics" do
        expect(page).to have_content("Total Specials: 2")
      end

    end

    it 'recalculates averages based upon querry' do
      dave = Comedian.create(name: 'dave', age: 40, city: "New York")
      dave.specials.create(name: "daves really funny", runtime: 20, img: "../../app/public/image/dave.png")

      john = Comedian.create(name: 'john', age: 20, city: "Denver")
      john.specials.create(name: "john is not funny", runtime: 10, img: "../../app/public/image/john.png")

      visit '/comedians?age=40'

      save_and_open_page

      within ".statistics" do
          expect(page).to have_content("Average Age 40")
          expect(page).to have_content("Average Runtime 20")
          expect(page).to have_content("New York")
        end

      end
 end
end

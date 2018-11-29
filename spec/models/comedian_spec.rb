RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
end

RSpec.describe Comedian do
  describe 'ClassMethods' do
    describe '.average_age' do
      it'should return the average age of all commedians' do

        Comedian.create(name: 'dave', age: 40, city: "new york")
        Comedian.create(name: 'john', age: 20, city: "denver")

        actual_result = Comedian.average_age
        expected_result = 30

        expect(actual_result).to eq(expected_result)
    end
   end
 end
end

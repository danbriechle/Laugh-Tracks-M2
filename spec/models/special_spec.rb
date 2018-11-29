RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end
    end
  end
end

RSpec.describe Special do
  describe 'ClassMethods' do
    describe '.average_runtime' do
      it'should return the average runtime of all specials' do
        Special.create(name: "daves really funny", runtime: 20, img: "../../app/public/image/dave.png")
        Special.create(name: "john is not funny", runtime: 10, img: "../../app/public/image/john.png")


        actual_result = Special.average_runtime
        expected_result = 15

        expect(actual_result).to eq(expected_result)
    end
   end
 end
end

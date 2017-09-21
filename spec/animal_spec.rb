require 'spec_helper'

describe 'Animal' do
  let(:animal) { Animal.new({ name: "Osrey", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 1}) }
  let(:animal2) { Animal.new({ name: "Osrey", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 1 }) }

  describe '#initialize' do
    it 'has a readable name attribute' do
      expect(animal.name).to eq "Osrey"
    end

    it 'has a readable gender attribute' do
      expect(animal.gender).to eq "Male"
    end

    it 'has a readable admittence date attribute' do
      expect(animal.admitted).to eq "2017-09-22"
    end

    it 'has a readable type attribute' do
      expect(animal.type).to eq "cat"
    end

    it 'has a readable breed attribute' do
      expect(animal.breed).to eq "maincoon"
    end

    it 'has a readable id attribute' do
      expect(animal.id).to eq nil
    end

    it 'has a readable adopted by attribute' do
      expect(animal.adopted_by).to eq 1
    end
  end

  describe '.all' do
    context 'when there is no entry in the database' do
      it 'will return an empty array' do
        expect(Animal.all).to eq []
      end
    end
  end

  describe '#save' do
    it 'will save animal to database' do
      animal.save
      expect(Animal.all).to eq [animal]
    end
  end
#  breed, type or by name
  # describe '.sort_by' do
  #   it 'will sort by name alphabetical'do
  #     expect(Animal.sort_by("name")).to eq
  #   end
  # end

  describe '#==' do
    it 'is the same animal if the information is the same' do
      expect(animal).to eq animal2
    end
  end
end

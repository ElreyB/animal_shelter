require 'spec_helper'

describe 'Animal' do
  let(:animal) { Animal.new({ name: "Osrey", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 0}) }
  let(:animal2) { Animal.new({ name: "Osrey", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 0 }) }

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

    context 'when saved' do
      it 'has a readable number' do
        animal.save
        expect(animal.id).to be_a Integer
      end
    end

    it 'has a readable adopted by attribute' do
      expect(animal.adopted_by).to eq 0
    end

    it 'has a readable empty string for image' do
      expect(animal.image).to eq "need photo"
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

  describe '.sort_by' do
    it 'will sort by name alphabetical'do
      animal3 = Animal.new({ name: "Bob", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 0})
      animal4 = Animal.new({ name: "Sam", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "maincoon", adopted_by: 0})
      animal4.save
      animal3.save
      animal2.save
      expect(Animal.sort_by("name")).to eq [animal3, animal2, animal4]
    end

    it 'will sort by type alphabetical'do
      animal3 = Animal.new({ name: "Bob", gender: "Male", admitted: "2017-09-22", type: "dog", breed: "maincoon", adopted_by: 0})
      animal4 = Animal.new({ name: "Sam", gender: "Male", admitted: "2017-09-22", type: "bird", breed: "maincoon", adopted_by: 0})
      animal4.save
      animal3.save
      animal2.save
      expect(Animal.sort_by("type")).to eq [animal4, animal2, animal3]
    end

    it 'will sort by breed alphabetical'do
      animal3 = Animal.new({ name: "Bob", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "ally", adopted_by: 0})
      animal4 = Animal.new({ name: "Sam", gender: "Male", admitted: "2017-09-22", type: "cat", breed: "sinamese", adopted_by: 0})
      animal4.save
      animal3.save
      animal2.save
      expect(Animal.sort_by("breed")).to eq [animal3, animal2, animal4]
    end
  end

  describe '#find' do
    it 'will find animal in shelter by id' do
      animal.save
      expect(Animal.find(animal.id)).to eq animal
    end
  end

  describe '#update' do
    it 'will update animal in database' do
      animal.save
      expect(Animal.all).to eq [animal]
    end

    it 'will update animals name by default in database' do
      animal.save
      animal.update({name: "Elrey"})
      expect(animal.name).to eq "Elrey"
    end

    context 'if adopted by a customer' do
      it 'will add owner to animal they adopted' do
        customer = Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "sinamese"})
        customer.save
        animal.save
        animal.update({adopted_by: customer.id}, "adopted_by")
        expect(animal.adopted_by).to eq customer.id
      end
    end
  end

  describe '#delete' do
    it 'will delete animal from database' do
      animal.save
      animal.delete
      expect(Animal.all).to eq []
    end
  end

  describe '#==' do
    it 'is the same animal if the information is the same' do
      expect(animal).to eq animal2
    end
  end
end

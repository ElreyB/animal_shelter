require 'spec_helper'

describe 'Customer' do
  let(:customer) { Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "maincoon"}) }
  let(:customer2) { Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "maincoon", :id => nil}) }
  let(:customer3) { Customer.new({:name => "Oscar", :phone => "847-383-9943", :email => "OscarTheGreat@gmail.com", :prefer_type => "dog", :prefer_breed => "German Shepherd", :id => nil}) }
  let(:saved_customers) {[customer3.save, customer2.save, customer.save]}

  describe '#initialize' do
    it 'has a readable name' do
      expect(customer.name).to eq "Elrey"
    end

    it 'has a readable phone number' do
      expect(customer.phone).to eq "200.365.2589"
    end

    it 'has a readable email address' do
      expect(customer.email).to eq "eb@yahoo.com"
    end

    it 'has a readable prefer type' do
      expect(customer.prefer_type).to eq "cat"
    end

    it 'has a readable prefer breed' do
      expect(customer.prefer_breed).to eq "maincoon"
    end

    it 'sets its #id when saved' do
      saved_customers
      expect(customer.id).to be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'will return an empty array' do
      expect(Customer.all).to eq []
    end
  end

  describe '#save' do
    it 'will save customer to database' do
      customer.save
      expect(Customer.all).to eq [customer]
    end
  end

  describe '.find' do
    it 'will find a customer by id' do
      saved_customers
      expect(Customer.find(customer2.id)).to eq customer2
    end
  end

  describe '.sort_by' do
    it 'will sort by customers by prefered breed' do
      customer1 = Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "sinamese"})
      customer1.save
      customer2.save
      customer3.save
      expect(Customer.sort_by("prefer_breed")).to eq [customer3, customer2, customer1]  
    end
  end

  describe '#==' do
    it 'is the same customer if it information' do
      expect(customer).to eq customer2
    end
  end
end

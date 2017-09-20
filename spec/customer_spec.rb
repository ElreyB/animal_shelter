require 'spec_helper'

describe 'Customer' do
  let(:customer) { Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "maincoon", :id => nil}) }

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
      customer.save
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

  describe '#==' do
    it 'is the same customer if it information' do
      customer2 = Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "maincoon", :id => nil})
      expect(customer).to eq customer2
    end
  end
end

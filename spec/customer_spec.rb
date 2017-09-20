require 'spec_helper'

describe 'Customer' do
  let(:customer) { Customer.new({:name => "Elrey", :phone => "200.365.2589", :email => "eb@yahoo.com", :prefer_type => "cat", :prefer_breed => "maincoon"}) }

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
  end
end

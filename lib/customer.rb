class Customer
  attr_reader :name, :phone, :email, :prefer_type, :prefer_breed, :id

  def initialize(args)
    @name = args[:name]
    @phone = args[:phone]
    @email = args[:email]
    @prefer_type = args[:prefer_type]
    @prefer_breed = args[:prefer_breed]
    @id = args.fetch(:id){ nil }
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    returned_customers.map do |customer|
      Customer.new({
        :name => customer.fetch('name'),
        :phone => customer.fetch('phone'),
        :email => customer.fetch('email'),
        :prefer_type => customer.fetch('prefer_type'),
        :prefer_breed => customer.fetch('prefer_breed'),
        :id => customer.fetch('id').to_i
        })
    end
  end

  def save
    result = DB.exec("INSERT INTO customers (name, phone, email, prefer_type, prefer_breed) VALUES ('#{@name}', '#{@phone}', '#{@email}', '#{@prefer_type}', '#{@prefer_breed}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
    Customer.all.find{ |customer| customer.id == id }
  end

  def ==(another_customer)
    self.name == another_customer.name &&
    self.phone == another_customer.phone &&
    self.email == another_customer.email &&
    self.prefer_type == another_customer.prefer_type &&
    self.prefer_breed == another_customer.prefer_breed &&
    self.id == another_customer.id
  end
end

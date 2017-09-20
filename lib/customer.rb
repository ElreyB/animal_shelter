class Customer
  attr_reader :name, :phone, :email, :prefer_type, :prefer_breed

  def initialize(args)
    @name = args.fetch(:name)
    @phone = args.fetch(:phone)
    @email = args.fetch(:email)
    @prefer_type = args.fetch(:prefer_type)
    @prefer_breed = args.fetch(:prefer_breed)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    returned_customers.map do |customer|
      Customer.new({
        :name => customer.fetch('name'),
        :phone => customer.fetch('phone'),
        :email => customer.fetch('email'),
        :prefer_type => customer.fetch('prefer_type'),
        :prefer_breed => customer.fetch('prefer_breed')
        })
    end
  end

  def ==(another_customer)
    self.name == another_customer.name &&
    self.phone == another_customer.phone &&
    self.email == another_customer.email &&
    self.prefer_type == another_customer.prefer_type &&
    self.prefer_breed == another_customer.prefer_breed
  end
end

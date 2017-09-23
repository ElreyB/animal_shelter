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
    customers = DB.exec("SELECT * FROM customers;")
    Customer.map_customers(customers)
  end

  def save
    result = DB.exec("INSERT INTO customers (name, phone, email, prefer_type, prefer_breed) VALUES ('#{@name}', '#{@phone}', '#{@email}', '#{@prefer_type}', '#{@prefer_breed}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
    Customer.all.find{ |customer| customer.id == id }
  end

  def self.sort_by(query)
    results = DB.exec("SELECT * FROM customers ORDER BY #{query} ASC")
    Customer.map_customers(results)
  end

  def update(args, query = "name")
    value = nil
    case query
    when "name"
      @name = args[:name]
      value = @name
    when "phone"
      @phone = args[:phone]
      value = @phone
    when "email"
      @email = args[:email]
      value = @email
    when "prefer_type"
      @prefer_type = args[:prefer_type]
      value = @prefer_type
    when "prefer_breed"
      @prefer_breed = args[:prefer_breed]
      value = @prefer_breed
    end
    DB.exec("UPDATE customer SET #{query} = #{value} WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM customers WHERE id = #{self.id};")
  end

  def ==(another_customer)
    self.name == another_customer.name &&
    self.phone == another_customer.phone &&
    self.email == another_customer.email &&
    self.prefer_type == another_customer.prefer_type &&
    self.prefer_breed == another_customer.prefer_breed &&
    self.id == another_customer.id
  end

  #helper-method

  def self.map_customers(customers)
    customers.map do |customer|
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
end

class Customer
  attr_reader :name, :phone, :email, :prefer_type, :prefer_breed

  def initialize(args)
    @name = args.fetch(:name)
    @phone = args.fetch(:phone)
    @email = args.fetch(:email)
    @prefer_type = args.fetch(:prefer_type)
    @prefer_breed = args.fetch(:prefer_breed)
  end
end

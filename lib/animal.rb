class Animal
  attr_reader :id, :name, :gender, :admitted, :type, :breed, :adopted_by

  def initialize(args)
    @id = args.fetch(:id){ nil }
    @name = args[:name]
    @gender = args[:gender]
    @admitted  = args[:admitted]
    @type = args[:type]
    @breed = args[:breed]
    @adopted_by = args.fetch(:adopted_by){ 0 }
  end

  def self.all
    animals = DB.exec("SELECT * FROM animals;")
    Animal.map_animals(animals)
  end

  def save
    id = DB.exec("INSERT INTO animals (name, gender, admitted, type, breed, adopted_by) VAlUES ('#{@name}', '#{@gender}', '#{@admitted}', '#{@type}', '#{@breed}', #{@adopted_by}) RETURNING id;")
    @id = id.first['id'].to_i
  end

  def self.sort_by(query)
    results = DB.exec("SELECT * FROM animals ORDER BY #{query} ASC")
    Animal.map_animals(results)
  end

  def ==(other_animal)
    self.id == other_animal.id &&
    self.name == other_animal.name &&
    self.gender == other_animal.gender &&
    self.admitted == other_animal.admitted &&
    self.type == other_animal.type &&
    self.breed == other_animal.breed &&
    self.adopted_by == other_animal.adopted_by
  end


 # helper method
  def self.map_animals(animals)
    list.map do |animal|
      Animal.new({
        id: animal['id'].to_i,
        name: animal['name'],
        gender: animal['gender'],
        admitted: animal['admitted'],
        type: animal['type'],
        breed: animal['breed'],
        adopted_by: animal['adopted_by'].to_i
        })
    end
  end
end

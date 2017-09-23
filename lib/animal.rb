class Animal
  attr_reader :id, :gender, :type, :name, :admitted, :breed, :adopted_by, :image

  def initialize(args)
    @id = args.fetch(:id){ nil }
    @name = args[:name]
    @gender = args[:gender]
    @admitted  = args[:admitted]
    @type = args[:type]
    @breed = args[:breed]
    @adopted_by = args.fetch(:adopted_by){ 0 }
    @image = args.fetch(:image){ "need photo" }
  end

  def self.all
    animals = DB.exec("SELECT * FROM animals;")
    Animal.map_animals(animals)
  end

  def save
    save_return_id = DB.exec("INSERT INTO animals (name, gender, admitted, type, breed, adopted_by, image) VAlUES ('#{@name}', '#{@gender}', '#{@admitted}', '#{@type}', '#{@breed}', #{@adopted_by}, '#{@image}') RETURNING id;")
    @id = save_return_id.first['id'].to_i
  end

  def update(args, query = "name")
    value = nil
    case query
    when "name"
      @name = args[:name]
      value = @name
    when "image"
      @image = args[:image]
      value = @image
    when "adopted_by"
      @adopted_by = args[:adopted_by]
      value = @adopted_by
      return DB.exec("UPDATE animals SET #{query} = #{value} WHERE id = #{self.id};")
    end
    DB.exec("UPDATE animals SET #{query} = '#{value}' WHERE id = #{self.id};")
  end

  def self.sort_by(query)
    results = DB.exec("SELECT * FROM animals ORDER BY #{query} ASC;")
    Animal.map_animals(results)
  end

  def self.find(id)
    animal = DB.exec("SELECT * FROM animals WHERE id = #{id};")
    Animal.map_animals(animal).first
  end

  def delete
    DB.exec("DELETE FROM animals WHERE id = #{self.id};")
  end

  def ==(other_animal)
    self.id == other_animal.id &&
    self.name == other_animal.name &&
    self.gender == other_animal.gender &&
    self.admitted == other_animal.admitted &&
    self.type == other_animal.type &&
    self.breed == other_animal.breed &&
    self.adopted_by == other_animal.adopted_by &&
    self.image == other_animal.image
  end


 # helper method
  def self.map_animals(animals)
    animals.map do |animal|
      Animal.new({
        id: animal['id'].to_i,
        name: animal['name'],
        gender: animal['gender'],
        admitted: animal['admitted'],
        type: animal['type'],
        breed: animal['breed'],
        adopted_by: animal['adopted_by'].to_i,
        image: animal['image']
        })
    end
  end
end

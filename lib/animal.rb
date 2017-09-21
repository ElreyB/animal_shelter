class Animal
  attr_reader :id, :name, :gender, :admitted, :type, :breed, :adopted_by

  def initialize(args)
    @id = args.fetch(:id){ nil }
    @name = args[:name]
    @gender = args[:gender]
    @admitted  = args[:admitted]
    @type = args[:type]
    @breed = args[:breed]
    @adopted_by = args.fetch(:adopted_by){ nil }
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
end

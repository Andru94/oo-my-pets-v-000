class Owner

  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = 'nervous'
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = 'nervous'
      dog.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
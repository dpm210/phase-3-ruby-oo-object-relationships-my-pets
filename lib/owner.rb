require "pry"

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def buy_cat(cat_name)
    cat_obj = Cat.all.find {|cat| cat.name == cat_name }
    cat_obj.owner = self
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Dog.all.select {|dog| dog.mood = "nervous"}
    Dog.all.select {|dog| dog.owner = nil}
    Cat.all.select {|cat| cat.mood = "nervous"}
    Cat.all.select {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

end
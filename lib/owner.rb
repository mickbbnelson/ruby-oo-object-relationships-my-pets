require "pry"

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all 
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  def cats 
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      if dog.owner == self
      dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end 

  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous" if cat.owner == self
    end
    Cat.all.each do |cat|
      cat.owner = nil if cat.owner == self
    end
    Dog.all.each do |dog|
      dog.mood = "nervous" if dog.owner == self
    end
    Dog.all.each do |dog|
      dog.owner = nil if dog.owner == self
    end
  end

  def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
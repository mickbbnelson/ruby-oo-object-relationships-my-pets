class Dog
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner, mood = "nervous")
    @owner = owner
    @name = name
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end
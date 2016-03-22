class User
  attr_accessor :first_name, :last_name, :id, :age
  @@all_users = []
  def initialize(fn, ln, id, age)
    @first_name = fn
    @last_name = ln
    @id = id
    @age = age
    @@all_users << self
  end

  def self.all
    @@all_users
  end
end

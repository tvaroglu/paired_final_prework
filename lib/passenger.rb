class Passenger
  attr_reader :name, :age

  def initialize(attributes)
    @name = attributes['name']
    @age = attributes['age']
    @driver = false
  end

  def adult?
    @age >= 18 ? true : false
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end

end

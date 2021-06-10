class Park
  attr_reader :name, :admission_price, :vehicles

  def initialize(attributes)
    @name = attributes['name']
    @admission_price = attributes['admission_price']
    @vehicles = Array.new
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def visitors
    @vehicles.flat_map do |vehicle|
      vehicle.passengers
    end
  end

  def total_revenue
    visitors.sum do |visitor|
      visitor.adult? ? @admission_price : 0
    end
  end

end

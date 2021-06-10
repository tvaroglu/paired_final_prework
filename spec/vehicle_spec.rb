require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/passenger'
require_relative '../lib/vehicle'


RSpec.describe Vehicle do

  it 'initializes' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')

    expect(vehicle.year).to eq('2001')
    expect(vehicle.make).to eq('Honda')
    expect(vehicle.model).to eq('Civic')

  end

  it 'can speed and add passengers' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')

    expect(vehicle.speeding?).to be false
    expect(vehicle.passengers.class).to eq(Array)
    expect(vehicle.passengers.length).to eq(0)

    charlie = Passenger.new({
      'name' => 'Charlie', 'age' => 18
      })
    jude = Passenger.new({
      'name' => 'Jude', 'age' => 20
      })
    taylor = Passenger.new({
      'name' => 'Taylor', 'age' => 12
      })
    passengers = [charlie, jude, taylor]
    passengers.each { |passenger| vehicle.add_passenger(passenger) }

    expect(vehicle.passengers.length).to eq(3)
    expect(vehicle.passengers[0].name).to eq('Charlie')
    expect(vehicle.passengers[1].name).to eq('Jude')
    expect(vehicle.passengers[2].name).to eq('Taylor')

    expect(vehicle.passengers[0].age).to eq(18)
    expect(vehicle.passengers[1].age).to eq(20)
    expect(vehicle.passengers[2].age).to eq(12)
    expect(vehicle.num_adults).to eq(2)
  end
  # 
  # xit 'can do more stuff' do
  #   # stuff
  # end

end

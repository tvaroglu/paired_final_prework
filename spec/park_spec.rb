require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/passenger'
require_relative '../lib/vehicle'
require_relative '../lib/park'


RSpec.describe Park do

  it 'initializes' do
    park = Park.new({
      'name' => 'Yellowstone',
      'admission_price' => 20})

    expect(park.class).to eq(Park)
    expect(park.name).to eq('Yellowstone')
    expect(park.admission_price).to eq(20)
  end

  it 'can add and list its vehicles and visitors' do
    park = Park.new({
      'name' => 'Yellowstone',
      'admission_price' => 20})

    expect(park.vehicles.class).to eq(Array)
    expect(park.vehicles.length).to eq(0)

    expect(park.visitors.class).to eq(Array)
    expect(park.visitors.length).to eq(0)

    charlie = Passenger.new({
      'name' => 'Charlie', 'age' => 18
      })
    taylor = Passenger.new({
      'name' => 'Taylor', 'age' => 12
      })
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    passengers = [charlie, taylor]
    passengers.each { |passenger| vehicle.add_passenger(passenger) }

    park.add_vehicle(vehicle)

    expect(park.vehicles.length).to eq(1)
    expect(park.vehicles.first.make).to eq('Honda')

    expect(park.visitors.length).to eq(2)
    expect(park.visitors.first.name).to eq('Charlie')
    expect(park.visitors.last.name).to eq('Taylor')
  end

  it 'can calculate total revenue' do
    park = Park.new({
      'name' => 'Yellowstone',
      'admission_price' => 20})

    expect(park.vehicles.class).to eq(Array)
    expect(park.vehicles.length).to eq(0)

    expect(park.visitors.class).to eq(Array)
    expect(park.visitors.length).to eq(0)

    charlie = Passenger.new({
      'name' => 'Charlie', 'age' => 18
      })
    taylor = Passenger.new({
      'name' => 'Taylor', 'age' => 12
      })
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    passengers = [charlie, taylor]
    passengers.each { |passenger| vehicle.add_passenger(passenger) }

    park.add_vehicle(vehicle)

    expect(park.total_revenue).to eq(20)
  end

end

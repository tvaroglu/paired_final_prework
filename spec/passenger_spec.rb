require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/passenger'


RSpec.describe Passenger do

  it 'initializes' do
    charlie = Passenger.new({
      'name' => 'Charlie', 'age' => 18
      })
    taylor = Passenger.new({
      'name' => 'Taylor', 'age' => 12
      })

    expect(charlie.class).to eq(Passenger)
    expect(charlie.name).to eq('Charlie')
    expect(charlie.age).to eq(18)

    expect(taylor.class).to eq(Passenger)
    expect(taylor.name).to eq('Taylor')
    expect(taylor.age).to eq(12)
  end

  it 'can be an adult and it can drive' do
    charlie = Passenger.new({
      'name' => 'Charlie', 'age' => 18
      })
    taylor = Passenger.new({
      'name' => 'Taylor', 'age' => 12
      })

    expect(taylor.adult?).to be false
    expect(charlie.adult?).to be true

    expect(charlie.driver?).to be false
    charlie.drive
    expect(charlie.driver?).to be true
  end

  xit 'can do more stuff' do
    # stuff
  end

end

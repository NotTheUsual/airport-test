require 'airport'
require 'plane'

describe "The grand finale (last spec)" do
	let(:airport) { Airport.new(capacity: 6) }
	# first you break it into 6 vars, then put them back into an array? 
	# plane1,plane2,plane3,plane4,plane5,plane6 = Array.new(6) { Plane.new }
	# test_planes = [plane1,plane2,plane3,plane4,plane5,plane6]
	test_planes = Array.new(6) { Plane.new }

	it "All planes can land and all planes can take off" do
		airport.stub(:check_weather) { :sunny }
		test_planes.each				{ |plane| expect(plane.status).to eq(:flying) }
		test_planes.each    		{ |plane| airport.try_to_land(plane) }
		test_planes.each				{ |plane| expect(plane.status).to eq(:landed) }
		airport.planes.dup.each { |plane| airport.try_to_eject(plane) }
		test_planes.each				{ |plane| expect(plane.status).to eq(:flying) }
	end
end
require 'airport'

describe Airport do
	let(:airport) { Airport.new }
	let(:plane)   { double :plane, land: :landed, fly: :flying }

	it "should have a capacity of 50 when created" do
		expect(airport.capacity).to eq(50)
	end

	it "should be able to be created with a capacity" do
		big_airport = Airport.new(capacity: 100)
		expect(big_airport.capacity).to eq(100)
	end

	context "(taking off and landing)" do
		
		it "should be able to land a plane" do
			expect{airport.land(plane)}.not_to raise_error
		end

		it "should tell a plane to land when it lands a plane" do
			expect(plane).to receive(:land)
			airport.land(plane)
		end

		it "should store a plane when it's landed" do
			airport.land(plane)
			expect(airport.planes).to include(plane)
		end

		it "should be able to get a plane to take off" do
			expect{airport.eject(plane)}.not_to raise_error
		end

		it "should tell a plane to fly when it gets it to take off" do
			expect(plane).to receive(:fly)
			airport.eject(plane)
		end

		it "should remove a plane form storage when it takes off" do
			airport.land(plane)
			expect(airport.planes).to include(plane)
			airport.eject(plane)
			expect(airport.planes).not_to include(plane)
		end

	end

end
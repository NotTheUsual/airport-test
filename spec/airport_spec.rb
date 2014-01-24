require 'airport'

describe Airport do
	let(:airport) 			{ Airport.new }
	let(:small_airport) { Airport.new(capacity: 2) }
	let(:plane)   			{ double :plane, land: :landed, fly: :flying }

	def fill_airport(airport)
		airport.capacity.times { airport.land(Plane.new) }
	end

	it "should have a capacity of 50 when created" do
		expect(airport.capacity).to eq(50)
	end

	it "should be able to be created with a capacity" do
		big_airport = Airport.new(capacity: 100)
		expect(big_airport.capacity).to eq(100)
	end

	context "(basic taking off and landing)" do
		
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

	context "(capacity controll)" do

		it "should know how many planes it has" do
			expect(airport.current_number_of_planes).to eq(0)
			airport.land(plane)
		end

		it "should know when it's full" do
			expect(small_airport).not_to be_full
			fill_airport(small_airport)
			expect(small_airport).to be_full
		end

		it "should stop planes landing when full" do
			fill_airport(small_airport)
			expect{small_airport.land(plane)}.to raise_error
		end

	end

	context "weather conditions" do
		
		it "should know what the weather is" do
			expect([:sunny, :stormy]).to include(airport.check_weather)
		end
		
	end

end
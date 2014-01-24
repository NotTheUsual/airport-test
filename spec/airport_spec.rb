require 'airport'

describe Airport do
	let(:airport) 			{ Airport.new }
	let(:small_airport) { Airport.new(capacity: 2) }
	let(:plane)   			{ double :plane, land: :landed, fly: :flying }

	def fill_airport(airport)
		airport.capacity.times { airport.try_to_land(Plane.new) }
	end

	it "should have a capacity of 20 when created" do
		expect(airport.capacity).to eq(20)
	end

	it "should be able to be created with a capacity" do
		big_airport = Airport.new(capacity: 50)
		expect(big_airport.capacity).to eq(50)
	end

	context "(basic taking off and landing)" do

		before do
			airport.stub(:check_weather) { :sunny }
		end
		
		it "should be able to land a plane" do
			expect{ airport.try_to_land(plane) }.not_to raise_error
		end

		it "should tell a plane to land when it lands a plane" do
			expect(plane).to receive(:land)
			airport.try_to_land(plane)
		end

		it "should store a plane when it's landed" do
			airport.try_to_land(plane)
			expect(airport.planes).to include(plane)
		end

		it "should be able to get a plane to take off" do
			expect{airport.try_to_eject(plane)}.not_to raise_error
		end

		it "should tell a plane to fly when it gets it to take off" do
			expect(plane).to receive(:fly)
			airport.try_to_eject(plane)
		end

		it "should remove a plane form storage when it takes off" do
			airport.try_to_land(plane)
			expect(airport.planes).to include(plane)
			airport.try_to_eject(plane)
			expect(airport.planes).not_to include(plane)
		end

	end

	context "(capacity control)" do

		before do
			Airport.any_instance.stub(:check_weather) { :sunny }
		end

		it "should know how many planes it has" do
			expect(airport.current_number_of_planes).to eq(0)
			airport.try_to_land(plane)
		end

		it "should know when it's full" do
			expect(small_airport).not_to be_full
			fill_airport(small_airport)
			expect(small_airport).to be_full
		end

		it "should stop planes landing when full" do
			fill_airport(small_airport)
			expect{ small_airport.try_to_land(plane) }.to raise_error
		end

	end

	context "(weather conditions)" do
		
		it "should know what the weather is" do
			expect([:sunny, :stormy]).to include(airport.check_weather)
		end

		it "should not let a plane land if the weather is stormy" do
			airport.stub(:check_weather) { :stormy }
			expect{ airport.try_to_land(plane) }.to raise_error
		end

		it "should not let a plane take off if the weather is stormy" do
			airport.stub(:check_weather) { :stormy }
			expect{ airport.try_to_eject(plane) }.to raise_error
		end

	end

end
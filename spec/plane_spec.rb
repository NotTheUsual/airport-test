require 'plane'
describe Plane do
	let(:plane) { Plane.new }
	
	it "should have a flying status when created" do
		expect(plane.status).to eq(:flying)
	end

	it "should be able to be landed" do
		plane.land
		expect(plane.status).to eq(:landed)
	end

	it "should be able to take off" do
		plane.fly
		expect(plane.status).to eq(:flying)
	end
end
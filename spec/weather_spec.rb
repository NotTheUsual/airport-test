require 'weather'

class WeatheredThing; include Weather; end

describe WeatheredThing do
	let(:airport) {WeatheredThing.new}

	it "should be able to get the status of the weather" do
		expect{airport.check_weather}.not_to raise_error
	end

	# again, this doesn't guarantee it. The method may happed to
	# return the expected value when you run the tests
	it "should only return sunny or stormy" do
		expect([:sunny, :stormy]).to include(airport.check_weather)
	end

	# You're testing randomness here. A much better way would be to
	# generate a large number of readings (e.g. 1000) and check that a
	# certain proportion within some range is stormy, e.g. 180-220 stormy values
	# if 200 are expected.
	it "should be reasonably random (not just storms)" do
		random_weather_reports = (0...5).map { airport.check_weather }
		just_storms = [:stormy] * 5
		expect(random_weather_reports).not_to eq(just_storms)
	end

	it "should be reasonably random (not just sunny)" do
		random_weather_reports = (0...30).map { airport.check_weather }
		just_sunny = [:sunny] * 30
		expect(random_weather_reports).not_to eq(just_sunny)
	end

	it "should know when it's stormy" do
		airport.stub(:check_weather) { :stormy }
		expect(airport).to have_inclement_weather
	end

end
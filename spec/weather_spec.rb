require 'weather'

class WeatheredThing; include Weather; end

describe WeatheredThing do
	let(:airport) {WeatheredThing.new}

	it "should be able to get the status of the weather" do
		expect{airport.check_weather}.not_to raise_error
	end

	it "should only return sunny or stormy" do
		expect([:sunny, :stormy]).to include(airport.check_weather)
	end

	it "should be reasonably random (not just storms)" do
		# I'm aware this isn't watertight, but it's better than the test above it
		random_weather_reports = (0...5).map { airport.check_weather }
		just_storms = [:stormy] * 5
		expect(random_weather_reports).not_to eq(just_storms)
	end

	it "should be reasonably random (not just sunny)" do
		# See previous comment
		random_weather_reports = (0...30).map { airport.check_weather }
		just_sunny = [:sunny] * 30
		expect(random_weather_reports).not_to eq(just_sunny)
	end

end
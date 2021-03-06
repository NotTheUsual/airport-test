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
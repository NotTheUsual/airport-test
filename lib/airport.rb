require 'weather'

class Airport
	include Weather

	attr_reader :capacity, :planes

	def initialize(capacity: 20)
		@capacity = capacity
		@planes = []
	end

	def try_to_land(plane)
		raise "Planes cannot land in inclement weather, sorry" if has_inclement_weather?
		raise "This airport is currently full, sorry" if full?
		plane.land
		dock(plane)
	end

	def dock(plane)
		@planes << plane
	end

	def try_to_eject(plane)
		raise "Planes cannot land in inclement weather, sorry" if has_inclement_weather?
		eject(plane)
		plane.fly
	end

	def eject(plane)
		@planes.delete(plane)
	end

	def full?
		current_number_of_planes == capacity
	end

	def current_number_of_planes
		@planes.length
	end
end
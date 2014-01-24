require 'weather'

class Airport
	include Weather

	attr_reader :capacity, :planes

	def initialize(capacity: 20)
		@capacity = capacity
		@planes = []
	end

	def try_to_land(plane)
		raise "Owing to inclement weather, we cannot allow planes to land at this time. You have our deepest apologies for any inconvenience." if has_inclement_weather?
		raise "This airport is currently full, sorry" if full?
		plane.land
		dock(plane)
	end

	def dock(plane)
		@planes << plane
	end

	def try_to_eject(plane)
		raise "Owing to inclement weather, we cannot allow planes to take off at this time. You have our deepest apologies for any inconvenience." if has_inclement_weather?
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
module DailyStrava

	class Athlete

		def initialize(args={})
			@profile_obj = args
		end
		

		def get_profile
			return @profile_obj
		end
	end
	
end
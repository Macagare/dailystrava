require 'net/http'
require "./lib/dailystrava/athlete.rb"

module DailyStrava

	class Controller
		
		@auth_response = ""
		@client_id = 0
		@secret_id = ""
		@code = ""
		@athlete = {}

		attr_reader :client_id, :athlete, :code

		def initialize(client_id, secret_id)
			@client_id = client_id
			@secret_id = secret_id
			@code = ""
		end

		def set_code(code)
			@code = code
		end

		def authorize_user(code="")
			@code = code unless code == ""
			uri = URI('https://www.strava.com/oauth/token')
			res = Net::HTTP.post_form(uri, 'client_id' => @client_id, 'client_secret' => @secret_id, 'code' => @code)
			@auth_response = res.body
			@athlete = DailyStrava::Athlete.new( @auth_response )
			@auth_response
		end

		def code
			@code
		end

		def client_id
			@client_id
		end

		def athlete
			@athlete
		end
		
	end
	
end
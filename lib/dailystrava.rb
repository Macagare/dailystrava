require "sinatra"
require 'strava/api/v3'
require "./lib/dailystrava/athlete.rb"
require "./lib/dailystrava/controller.rb"

controller = DailyStrava::Controller.new(0, "a")

get "/" do
	"Welcome to DailyStrava"
end

get "/login" do
	url = "https://www.strava.com/oauth/authorize?client_id=#{controller.client_id}&response_type=code&redirect_uri=http://localhost/token_exchange&scope=write&state=mystate&approval_prompt=force"
	redirect url, 303
end

get "/token_exchange" do
	controller.authorize_user params["code"]
	puts controller.athlete.inspect
	"authorization received"
end

# get "/activities" do
# 	get_activities().to_json
# end

# get "/activities/:id" do
# 	get_activity_by_id(params["id"]).to_json
# end

# def get_activities
# 	client = Strava::Api::V3::Client.new(:access_token => controller.code)
# 	return client.list_athlete_activities
# end

# def get_activity_by_id(id)
# 	client = Strava::Api::V3::Client.new(:access_token => controller.code)
# 	return client.retrieve_an_activity(id)
# end
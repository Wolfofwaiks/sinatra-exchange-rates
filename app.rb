require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE")}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

 erb(:homepage)
end

get ("/:first_symbol") do

  @the_symbol = params.fetch("first_symbol")

  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE")}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

  erb(:step_one)

end 


get ("/:first_symbol/:second_symbol") do

  @from = params.fetch("first_symbol")
  @to = params.fetch("second_symbol")

  erb(:step_two)

 

end 

class DiscoverController < ApplicationController

def save_results  
  @location = params.fetch(:input_location)

  require "openai"

  openai_client = OpenAI::Client.new(
    access_token: ENV.fetch("CHAT_KEY"),
    request_timeout: 240,
  )
  response = openai_client.chat(
    parameters: {
      model: "gpt-3.5-turbo", # Required.
      messages: [
        { role: "system", content: "Provide the five best hipster coffee shops as of your data cut-off in a sample JSON based on the location provided by the user. Output will look like this {:id, :name, :address, :latitude, :longitude, :rating}. It is ok that it is not real time. Give me no output except the JSON" },
        { role: "user", content: @location },
      ], # Required.
      temperature: 0,
    },
  )

  message = response.fetch("choices").at(0).fetch("message").fetch("content")

  output = JSON.parse(message)

  coffee_shops = output.fetch("coffee_shops")

  coffee_shops.each do |coffee|
    name = coffee.fetch("name")
    address = coffee.fetch("address")
    latitude = coffee.fetch("latitude")
    longitude = coffee.fetch("longitude")
    rating = coffee.fetch("rating")
    shop = Shop.new
    shop.name = name
    shop.address = address
    shop.latitude = latitude
    shop.longitude = longitude
    shop.rating = rating
    save_status=shop.save
  end

  if save_status == true
    redirect_to("/results")
  else
    redirect_to("/discover", {:alert => user.errors.full_messages.to_sentence })
  end
end



end

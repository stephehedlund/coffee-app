require "openai"
  
openai_client = OpenAI::Client.new(
    access_token: ENV.fetch("CHAT_KEY"),
    request_timeout: 240
)
response = openai_client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [
          { role: "system", content: "Provide the best hipster coffee shops as of your data cut-off in a sample JSON based on the location provided by the user. Output will look like this {:id, :name, :address, :latitude, :longitude, :rating}. It is ok that it is not real time. Give me no output except the JSON"},
          { role: "user", content: "fayetteville, arkansas" }], # Required.
        temperature: 0,
    })

    message = response.fetch("choices").at(0).fetch("message").fetch("content")
    
    output = JSON.parse(message)

     p output
    #p response

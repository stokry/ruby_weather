require 'json'
require 'uri'
require 'net/http'

def get_weather(city_name)
  api_key = 'YOUR_API_KEY' # Replace with your OpenWeatherMap API key

  uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(city_name)}&appid=#{api_key}")
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)

  if data['cod'] == 200
    weather_description = data['weather'][0]['description']
    temperature = data['main']['temp']
    humidity = data['main']['humidity']
    wind_speed = data['wind']['speed']

    puts "Weather in #{city_name}:"
    puts "Description: #{weather_description}"
    puts "Temperature: #{temperature} K"
    puts "Humidity: #{humidity}%"
    puts "Wind Speed: #{wind_speed} m/s"
  else
    puts "Unable to fetch weather data for #{city_name}. Error: #{data['message']}"
  end
end

print 'Enter a city name: '
city = gets.chomp

get_weather(city)

require_relative 'city'

def path_finder(array_of_cities, current_city)
  answer = [current_city.name]
  while !current_city.visited
    next_city = array_of_cities[0]
    array_of_cities.each_with_index do |possible_city, index|
        if find_distance(current_city, next_city) > find_distance(current_city, possible_city)
          next_city = possible_city
        end
    end
        current_city.visited = true
        current_city = next_city
        array_of_cities -= [next_city]
        return answer if array_of_cities[0].nil?
        answer << current_city.name
  end
end

def find_distance(city1, city2)
  x_distance = city1.x_value - city2.x_value
  y_distance = city1.y_value - city2.y_value

  total = Math.sqrt(x_distance**2 + y_distance**2)
end

city1 = City.new("Cooltopolus", 10, 25)
city2 = City.new("Bobville", -100, 33)
city3 = City.new("FakePlace", 44, 55)
city4 = City.new("Dogtown", 73, -78)

start_city = City.new("My House", -12, 80)

city_array = [city1, city2, city3, city4]

final = path_finder(city_array, start_city)

puts final

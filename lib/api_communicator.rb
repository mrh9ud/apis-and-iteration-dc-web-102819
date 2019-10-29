require 'rest-client'
require 'json'
require 'pry'

def get_film_list(character_name, response_hash)
  films = []
  response_hash["results"].each { | character |
    if character["name"].downcase == character_name
      films = character["films"]
    end
  }
  films
end

def get_film_hashes(film_array)
  film_info = film_array.map { | url |
    response_film = RestClient.get(url)
    response_film_data = JSON.parse(response_film)
    response_film_data
  }
  film_info
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  film_array = get_film_list(character_name, response_hash)
  
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  films_data = get_film_hashes(film_array)
  
  #  i.e. an array of hashes in which each hash reps a given film
  # return value of this method should be collection of info about each film.
  # this collection will be the argument given to `print_movies`
  films_data

end

def print_movies(films)
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  # some iteration magic and puts out the movies in a nice list

  titles = films.map { | movie |
    movie["title"]
    }

  puts titles
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

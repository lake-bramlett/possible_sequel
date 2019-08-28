KEYS = Dotenv.load

module  API
  class Interface
    def self.call_by_title(url)
      response = RestClient::Request.execute(
        :method => :get,
        :url => "http://www.omdbapi.com/?apikey=#{KEYS["API_KEY"]}&t=#{url}"
      )
    end
    def self.call_by_id(id)#not finished
      response = RestClient::Request.execute(
        :method => :get,
        :url => "http://www.omdbapi.com/?apikey=#{KEYS["API_KEY"]}&i=#{id}"
      )

    end
    def self.call_by_actor(names)
      names = names.split(",")
      length = names.length
      name = names[rand(0..(length-1))].split(" ")
      name = name.join("%20")
      response = RestClient::Request.execute(
        :method => :get,
        :url => "https://api.themoviedb.org/3/search/person?api_key=#{KEYS["API_KEY2"]}&language=en-US&query=#{name}&page=1&include_adult=false"
      )
    end
  end
end

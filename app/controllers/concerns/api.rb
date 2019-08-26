KEYS = Dotenv.load

module  API
  class Interface
    def self.callc(url)
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
    def self.call(name)
      # name = name.split(" ")
      # name = name.join("%20")
      response = RestClient::Request.execute(
        :method => :get,
        :url => "https://api.themoviedb.org/3/search/person?api_key=75438cd32f62f19d721c443235a247c3&language=en-US&query=leonardo%20dicaprio&page=1&include_adult=false"
      )

    end
  end
end

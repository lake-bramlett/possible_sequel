KEYS = Dotenv.load

module  API
  class Interface
    def self.call(url)
      response = RestClient::Request.execute(
        :method => :get,
        :url => "http://www.omdbapi.com/?apikey=#{KEYS["API_KEY"]}&t=#{url}"
      )
    end
  end
end

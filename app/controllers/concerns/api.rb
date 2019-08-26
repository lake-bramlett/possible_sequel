module  API
  class Interface
    def self.call(url)
      apikey = "apikey=5316d316"
      response = RestClient::Request.execute(
        :method => :get,
        :url => "http://www.omdbapi.com/?#{apikey}&t=#{url}"
      )
    end
  end
end

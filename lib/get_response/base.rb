module GetResponse
  class Base
    API_ENDPOINT = 'https://api.getresponse.com/v3'

    def headers
      {
        'User-Agent'    => 'GetResponse Ruby SDK',
        'Content-Type'  => 'application/json'
      }
    end

    [:post, :get].each do |method|
      define_method "#{method}_call" do |action, params, headers|
        connection.send("#{method}") do |req|
          req.url action
          req.params = params
          req.headers = headers
        end
      end
    end

    private

    def connection
      @connection ||= Faraday.new(url: api_endpoint) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def api_endpoint
      API_ENDPOINT
    end

    def logging(msg)
      puts "[GETRESPONSE-LOG] #{msg}" if GetResponse.config.verbose
    end
  end
end

module GetResponse
  class Base
    API_ENDPOINT = 'https://api3.getresponse360.com'

    [:post, :get].each do |method|
      define_method "#{method}_call" do |action, params|
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
      GetResponse.config.api_endpoint || API_ENDPOINT
    end

    def headers
      user_agent_header
        .merge(json_header)
        .merge(auth_header)
        .merge(domain_header)
    end

    def user_agent_header
      { 'User-Agent' => 'GetResponse Ruby SDK' }
    end

    def json_header
      { 'Content-Type' => 'application/json' }
    end

    def auth_header
      return {} unless GetResponse.config.api_key
      { 'X-Auth-Token' => "api-key #{GetResponse.config.api_key}" }
    end

    def domain_header
      return {} unless GetResponse.config.domain_header
      { 'X-Domain' => GetResponse.config.domain_header }
    end

    def logging(msg)
      puts "[GETRESPONSE-LOG] #{msg}" if GetResponse.config.verbose
    end
  end
end

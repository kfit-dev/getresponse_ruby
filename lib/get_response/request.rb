module GetResponse
  class Request

    class << self
      DEFAULT_API_ENDPOINT = 'https://api3.getresponse360.com'
      DEFAULT_API_VERSION  = 'v3'

      [:post, :get].each do |method|
        define_method method do |path, params|
          connection.send("#{method}") do |req|
            req.url build_api_path(path)
            req.params = params if method == :get
            req.body = (params || {}).to_json if method == :post
            req.headers = headers
          end
        end
      end

      # TODO
      def delete
        puts 'delete = todo'
      end

      private

      def connection
        @connection ||= Faraday.new(url: api_endpoint) do |faraday|
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
          faraday.response :logger, GetResponse.config.logger if verbose?
        end
      end

      def verbose?
        GetResponse.config.verbose
      end

      def api_endpoint
        GetResponse.config.api_endpoint || DEFAULT_API_ENDPOINT
      end

      def build_api_path(path)
        "#{api_version}/#{path}"
      end

      def api_version
        GetResponse.config.api_version || DEFAULT_API_VERSION
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
end

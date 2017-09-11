module GetResponse
  class Response
    def initialize(response)
      @response = response
    end

    def body
      JSON.parse(@response.body)
    rescue JSON::ParserError => e
      {}
    end

    def success?
      [200, 201, 202].include? @response.status
    end

    def rate_limited?
      @response.status == 429
    end

    def rate_limit_reset_time
      @response.headers['x-ratelimit-reset']&.to_i
    end
  end
end

module GetResponse
  class Response
    def initialize(response)
      @response = response
    end

    def success?
      [200, 201, 202].include? @response.status
    end
  end
end

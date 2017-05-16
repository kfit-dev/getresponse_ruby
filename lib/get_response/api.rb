module GetResponse
  class Api

    def initialize
      @path_parts = []
    end

    def method_missing(method, *args)
      @path_parts << method.to_s.gsub("_", "-").downcase
      @path_parts << args if args.length > 0
      @path_parts.flatten!
      self
    end

    def create(params = {})
      resp = GetResponse::Request.post(path, params)
      Response.new(resp)
    ensure
      reset
    end

    def update(params)
      resp = GetResponse::Request.post(path, params)
      Response.new(resp)
    ensure
      reset
    end

    def retrieve(params = {})
      resp = GetResponse::Request.get(path, params)
      Response.new(resp)
    ensure
      reset
    end

    def delete
      resp = GetResponse::Request.delete(path, params)
      Response.new(resp)
    ensure
      reset
    end

    private

    def path
      @path_parts.join('/')
    end

    def reset
      @path_parts = []
    end
  end
end

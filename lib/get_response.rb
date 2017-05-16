require 'faraday'
require "get_response/version"
require "get_response/request"
require "get_response/api"
require "get_response/response"

module GetResponse
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @config ||= Config.new
    end
    alias_method :config, :configuration
  end

  class Config
    attr_accessor :api_key, :verbose, :api_endpoint, :domain_header, :api_version
  end
end

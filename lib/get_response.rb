require 'faraday'
require "get_response/version"
require "get_response/base"
require "get_response/response"
require "get_response/contacts"

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

  class Api
    class << self
      def contacts
        @contacts ||= Contacts.new
      end
    end
  end

  class Config
    attr_accessor :api_key, :verbose
  end
end

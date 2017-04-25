require 'json'

module Tourvisor
  class UnknownFormatError < StandardError; end

  class Configuration
    DEFAULT_BASE_URL = 'http://tourvisor.ru/xml'.freeze
    DEFAULT_FORMAT = 'json'.freeze

    attr_accessor :base_url
    attr_accessor :format
    attr_accessor :login
    attr_accessor :password

    def initialize(**params)
      self.base_url = Tourvisor::Configuration::DEFAULT_BASE_URL
      self.format = Tourvisor::Configuration::DEFAULT_FORMAT

      params.each do |name, value|
        public_send("#{name}=", value) if respond_to?("#{name}=")
      end
    end

    def build_path(path)
      "#{base_url}/#{path}"
    end

    def parse(body)
      case format
      when 'json' then JSON.parse(body, symbolize_names: true)
      else raise UnknownFormatError, "Unknown format: #{format}"
      end
    end

    def params
      {
        authlogin: login,
        authpass: password,
        format: format
      }
    end
  end
end

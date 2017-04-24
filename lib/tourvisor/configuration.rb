module Tourvisor
  class Configuration
    DEFAULT_BASE_URL = 'http://tourvisor.ru/xml'
    DEFAULT_FORMAT = 'json'

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
  end
end

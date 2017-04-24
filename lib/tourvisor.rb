require 'tourvisor/version'
require 'tourvisor/configuration'

module Tourvisor
  class << self
    def configure
      yield config
      config
    end

    def config
      @config ||= Tourvisor::Configuration.new
    end
  end
end

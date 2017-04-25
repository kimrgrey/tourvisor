require 'tourvisor/version'
require 'tourvisor/configuration'
require 'tourvisor/request'

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

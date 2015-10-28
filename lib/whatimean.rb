require 'whatimean/find'
require 'whatimean/google'
require 'whatimean/word'
require 'whatimean/version'

module WhatIMean
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = 'MY_API_KEY'
    end
  end

  def self.is?(*words)
    Find.new(client, *words)
  end

  def self.client
    @client ||= Google.new(WhatIMean.configuration.api_key)
  end
end

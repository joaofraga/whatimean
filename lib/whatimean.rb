require 'whatimean/find'
require 'whatimean/google'
require 'whatimean/word'
require 'whatimean/version'

module WhatIMean
  class << self
    attr_accessor :configuration
  end

  # Call this method to modify defaults in your initializers.
  #
  # @example
  #   WhatIMean.configure do |config|
  #     config.api_key = 'MY_API_KEY'
  #   end
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # = Configuration
  #
  # Where you configure WhatIMean.
  class Configuration
    # The Google Console API key for your project.
    attr_accessor :api_key

    def initialize
      @api_key = 'MY_API_KEY'
    end
  end

  # Compare strings and return a list ordered by occurence
  # @param [Array<String>] words The words to be compared
  # @return [Array<Word>] the words with hits counter and comparison rates
  def self.is(*words)
    Find.new(client, *words)
  end

  private

  # The WhatIMean::Google client
  def self.client
    @client ||= Google.new(WhatIMean.configuration.api_key)
  end
end

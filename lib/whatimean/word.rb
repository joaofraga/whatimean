module WhatIMean

  class Word
    attr_accessor :name, :hits, :rate

    # Instatiate a new Word with following attributes:
    # @param [Hash] attributes Data that will be set in Word.
    #
    # @option attributes [String] :name Word name
    # @option attributes [Fixnum] :hits Estimated hit count (occurrences)
    # @option attributes [Float] :rate Rate comparison based on total value
    def initialize(attributes)
      attributes.each do |key, value|
        send("#{key}=", value)
      end

      self
    end

    # Calculate
    # @param [Float] total The total ammount to be compared
    # @return [Word] self object
    def calculate_rate(total)
      self.rate = hits / total.to_f
      self
    end
  end
end

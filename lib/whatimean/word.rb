module WhatIMean
  class Word
    attr_accessor :name, :hits, :rate

    def initialize(attributes)
      attributes.each do |key, value|
        send("#{key}=", value)
      end

      self
    end

    def calculate_rate(total)
      self.rate = hits / total.to_f
      self
    end
  end
end

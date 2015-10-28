module WhatIMean
  class Find
    attr_reader :words

    def initialize(client, *words)
      @client = client
      @words = fetch_words(words).sort { |x,y| y.hits <=> x.hits }
    end

    def winner
      @words.first
    end

    private

    def fetch_words(words)
      words = words.map do |word|
        @client.search(word)
      end

      calculate_rate(words)
    end

    def calculate_rate(words)
      total = words.map(&:hits).inject(&:+).to_f
      words.map { |word| word.calculate_rate(total) }
    end
  end
end

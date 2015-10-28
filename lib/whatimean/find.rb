module WhatIMean
  # = Find
  # The Core of WhatIMean, this class interacts with Google and Word and
  # fetch the search returning each word with hits, name and rate comparison
  class Find
    attr_reader :words

    # Compare strings and return a list ordered by occurence
    # @param [Google] client The WhatIMean::Google client
    # @param [Array<String>] words The words to be compared
    # @return [Find] the words with hits counter and comparison rates
    def initialize(client, *words)
      @client = client
      @words = fetch_words(words).sort { |x,y| y.hits <=> x.hits }
    end

    # Returns the word in comparison with most results
    # @return [Word] The winner with most occurences
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

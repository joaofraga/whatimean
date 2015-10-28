require 'json'
require 'open-uri'
require 'cgi'

module WhatIMean
  class Google
    # Url to Google Custom Search API
    BASE_URL = 'https://www.googleapis.com/customsearch/v1?cref&key={key}&q={word}'

    # Instantiate a new Google client object
    # @param [String] key Google Console Custom Search API KEY
    # @return [Google]
    def initialize(key)
      @key = key
    end

    # Searchs a string with Google Custom Search
    # @param [String] word
    # @return [Word]
    def search(word)
      WhatIMean::Word.new(name: word, hits: fetch_word(word))
    end

    private

    def url_to(word)
      BASE_URL.gsub(/{key}/, @key).gsub(/{word}/, CGI.escape(word))
    end

    def fetch_word(word)
      open(url_to(word), "Referer" => "http://whatimean.com", "User-Agent" => "WhatIMean::Robot", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE) do |f|
        JSON.parse(f.read)['searchInformation']['totalResults'].to_i
      end
    end
  end
end

require 'json'
require 'open-uri'
require 'cgi'

module WhatIMean
  class Google
    BASE_URL = 'https://www.googleapis.com/customsearch/v1?cref&key={key}&q={word}'

    def initialize(key)
      @key = key
    end

    def search(word)
      WhatIMean::Word.new(name: word, hits: fetch_word(word))
    end

    private

    def url_to(word)
      BASE_URL.gsub(/{key}/, @key).gsub(/{word}/, CGI.escape(word))
    end

    def fetch_word(word)
      begin
        open(url_to(word), "Referer" => "http://whatimean.com", "User-Agent" => "WhatIMean::Robot", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE) do |f|
          JSON.parse(f.read)['searchInformation']['totalResults'].to_i
        end
      rescue OpenURI::HTTPError => e
        e
      end
    end
  end
end

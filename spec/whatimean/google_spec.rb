require 'spec_helper'

describe WhatIMean::Google, :vcr do
  it 'has a base url' do
    expect(WhatIMean::Google::BASE_URL).not_to be nil
  end

  describe 'search' do
    let(:google) { WhatIMean::Google.new GOOGLE_API_KEY }
    let(:search) { google.search('google') }

    it 'responds to search' do
      expect(google).to respond_to(:search)
    end

    it 'returns a new WhatIMean::Word with empty rate' do
      expect(search).to be_instance_of(WhatIMean::Word)
      expect(search.hits).to be_instance_of(Fixnum)
      expect(search.name).to be_instance_of(String)
      expect(search.rate).to be nil
    end
  end

  describe 'fetch_word' do
    it 'returns OpenURI::HTTPError when request is not valid' do
      invalid = WhatIMean::Google.new 'INVALID_KEY'
      expect{invalid.search('invalid')}.to raise_error(OpenURI::HTTPError)
    end
  end
end

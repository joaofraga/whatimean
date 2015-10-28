require 'spec_helper'

describe WhatIMean, :vcr do
  it 'has a version number' do
    expect(WhatIMean::VERSION).not_to be nil
  end

  describe 'configuration' do
    it 'allow user to customize configuration' do
      expect(WhatIMean).to respond_to(:configuration)
      expect(WhatIMean).to respond_to(:configure)
    end

    it 'accepts google api_key' do
      WhatIMean.configure { |config| config.api_key = "NEW_API" }
      expect(WhatIMean.configuration.api_key).to eq("NEW_API")
    end
  end

  describe '.is?' do
    before(:each) do
      WhatIMean.configure do |config|
        config.api_key = GOOGLE_API_KEY
      end
    end

    let(:whatimean) { WhatIMean.is? 'google', 'altavista' }

    it 'initialize a Find.new' do
      expect(WhatIMean).to respond_to(:is?)
    end

    it 'returns a instance of WhatIMean::Find' do
      expect(whatimean).to be_instance_of(WhatIMean::Find)
    end
  end
end

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

# TODO: Configure VCR/Webmock
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# require 'webmock/rspec'
require 'whatimean'
require 'vcr'

# WebMock.disable_net_connect!(allow_localhost: true)
GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']

RSpec.configure do |config|
  # config.extend VCR::Rspec::Macros
  # config.before(:each) do
  #   stub_request(:get, /googleapis.com/).
  #     with(headers: {'Accept'=>'*/*', 'User-Agent'=>'WhatIMean::Robot'}).
  #     to_return(status: 200, body: "stubbed response", headers: {})
  # end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  # config.hook_into :webmock # or :fakeweb
end

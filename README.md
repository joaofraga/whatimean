# Whatimean

[![Code Climate](https://codeclimate.com/github/joaofraga/whatimean/badges/gpa.svg)](https://codeclimate.com/github/joaofraga/whatimean) [![Test Coverage](https://codeclimate.com/github/joaofraga/whatimean/badges/coverage.svg)](https://codeclimate.com/github/joaofraga/whatimean/coverage) [![Build Status](https://travis-ci.org/joaofraga/whatimean.svg)](https://travis-ci.org/joaofraga/whatimean)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/whatimean`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whatimean'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whatimean

## Usage

First add your Google Console API Key:

``` ruby
WhatIMean.configure do |config|
  config.api_key = "MY_API"
end
```

You can now discover which word is the correct using:

``` ruby
WhatIMean.is? 'word1', 'word2'
```

To discover the winner, just:

``` ruby
word_fight = WhatIMean.is? 'google', 'altavista'
word_fight.winner

#=> #<WhatIMean::Word:0x007ffcba4960d8 @name="google", @hits=824000000, @rate=0.9987031403396075>
```

To list the searched words:

``` ruby
word_fight = WhatIMean.is? 'google', 'altavista'
word_fight.words

#=> [#<WhatIMean::Word:0x007ffcba4960d8 @name="google", @hits=824000000, @rate=0.9987031403396075>, #<WhatIMean::Word:0x007ffcba4ae750 @name="altavista", @hits=1070000, @rate=0.0012968596603924515>]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joaofraga/whatimean. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


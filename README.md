# RemoteOverflowReporter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'RemoteOverflowReporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RemoteOverflowReporter

## Usage

E.g.,
```bash
$ bundle exec remote_overflow_reporter -l "San Francisco, CA" -r 20 -R -L5
 category                     | count | appearance %
------------------------------+-------+--------------
 javascript                   | 79    | 30%
 c#                           | 36    | 14%
 ruby-on-rails                | 36    | 14%
 python                       | 34    | 13%
 php                          | 30    | 11%

total number of listings: 263
displaying top 5 categories
```

For detailed usage instructions, run the following command:

    $ bundle exec remote_overflow_reporter --help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/RemoteOverflowReporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

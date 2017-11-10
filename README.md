# CachedRunOnce

Allows a block of code to be executed just once within the lifetime of its owner, caching the result.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cached_run_once'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cached_run_once

## Usage

```ruby
	class SubjectA
		include CachedRunOnce

		def first_method
			@counter ||= 0
			@counter += 1
		end

		def second_method
			cached_run_once do
				@counter ||= 0
				@counter += 1
			end
		end
	end
```

```ruby
subject = SubjectA.new
subject.first_method => 1
subject.first_method => 2
subject.second_method => 3
subject.first_method => 4
subject.second_method => 3
subject.first_method => 5

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aarontc/cached_run_once.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# MinimalLogging
Minimal Logging removes some of the noise from the Rails Server log so you can focus on the most important events.  It also formats parameters and actions in a more readable way to quickly see what's going on.

So you can go from this
![Image of Normal Rails Log](http://i.imgur.com/UtmFpyt.png)

To this
![Image of Rails Log with Minimal Logging](http://i.imgur.com/o1fYDre.png)

## Installation

Add this to your application's Gemfile:

```ruby
group :development do
  gem 'minimal_logging'
end
```

And then execute:

    $ bundle

Or install it yourself:

    $ gem install minimal_logging

## Usage

You can set minimal_logging's configuration options in application.rb or development.rb in your config.

By default, minimal_logging will change your log_level to :info.  If you want to set the log level yourself, you can turn this behavior off.
 ```ruby
 config.minimal_logging.change_log_level = false
 ```

You can turn logging assets back on.  Much of the logic for quietting assets thanks to the [quiet_assets](https://github.com/evrone/quiet_assets) gem.
```ruby
config.minimal_logging.quiet_assets = false
```

And you can turn off minimal_logging itself.
```ruby
config.minimal_logging.enabled = false
```

## Contributing

1. Fork it ( https://github.com/nelsonscott/minimal_logging/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

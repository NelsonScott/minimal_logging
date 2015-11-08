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

For best results I also recommend installing the [quiet assets gem](https://github.com/evrone/quiet_assets) to remove noisy logging from your assets.  

 By default, minimal_logging will change your log_level to :info.  If you want to set the log_level yourself, you can turn off this behavior (either in application.rb or development.rb in config).
 ```ruby
 config.minimal_logging.change_log_level = false
 ```

If you need a more verbose log, you can turn off minimal_logging at any time.
```ruby
config.minimal_logging.enabled = false
```

## Contributing

1. Fork it ( https://github.com/nelsonscott/minimal_logging/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

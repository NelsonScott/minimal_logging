# MinimalLogging
Minimal Logging removes some of the noise from the Rails Server log so you can focus on the most important events.  It also formats parameters and actions in a more readable way to quickly see what's going on.

So you can go from this
![Image of Normal Rails Log](http://i.imgur.com/UtmFpyt.png)

To this
![Image of Rails Log with Minimal Logging](http://i.imgur.com/o1fYDre.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minimal_logging'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minimal_logging

## Usage

For best results I also recommend:
 1. Installing the [quiet assets gem](https://github.com/evrone/quiet_assets) to remove noisy logging from your assets.  
 2. Setting your log_level to `:info`
 In config/environments/development.rb
```ruby
config.log_level = :info
```

If you need a more verbose log, you can turn off minimal_logging at any time by setting the config variable in application.rb
```ruby
config.minimal_logging.enabled = false
```

## Contributing

1. Fork it ( https://github.com/nelsonscott/minimal_logging/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Vitruvius

Vitruvius is a gem for generating Sinatra fakes for use in testing from a
schema. It is built in a modular fashion to support multiple schema types.

## Name

[Vitruvius][vitruvius] was an ancient Roman architect and engineer, famous for
authoring the [definitive guide][de architectura] to ancient architectural
techniques.

[vitruvius]: https://en.wikipedia.org/wiki/Vitruvius
[de architectura]: https://en.wikipedia.org/wiki/De_architectura

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vitruvius'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vitruvius

## Usage

```ruby
parser = Vitruvius::Parser::JSONSchema.new(path_to_schema)
app = Vitruvius::App.new(parser).build
# => returns a Sinatra application
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/JoelQ/vitruvius.

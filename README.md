# Limpio

For some reason, you become some nasty `nil`s in a response that you do not want to have?? you can get rid of them with this gem. It removes recursively the `nil`s in Arrays and Hashes. The gems knows how to treat each kind of Object (String, true, false, etc) that in inside of the Hash/Array.

TIP: before using this gem, make sure why you are getting those ugly `nil`s. Avoid them at all costs ;).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'limpio'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install limpio

## Usage

The gem's API is really simple...it just contains one method.

For an Array:
```ruby
array = [
  "value1",
  "",
  {
    key4: "value4",
    key5: "",
    key6: {
      key7: {}
    }
  },
  {},
  nil,
  [],
  [nil, 1.23],
  [nil, 123, false, true],
  true,
  false
]

result = array.deep_reject_blank!

p result
[
  "value1",
  {
    key4: "value4"
  },
  [1.23],
  [123, false, true],
  true,
  false
]
```

For an Hash:
```ruby
hash = {
  key1: "value1",
  key2: "",
  key3: {
    key4: "value4",
    key5: "",
    key6: {
      key7: {}
    }
  },
  key8: {},
  key9: nil,
  key10: [],
  key11: [nil, 1.23],
  key12: [nil, 123, false, true],
  key13: true,
  key14: false
}

result = hash.deep_reject_blank!

p result
{
  key1: "value1",
  key3: {
    key4: "value4"
  },
  key11: [1.23],
  key12: [123, false, true],
  key13: true,
  key14: false
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mariiillo/limpio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mariiillo/limpio/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Limpio project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mariiillo/limpio/blob/master/CODE_OF_CONDUCT.md).

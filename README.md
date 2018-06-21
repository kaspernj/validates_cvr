# ValidatesCvr

Validates danish CVR numbers on your models.

## Usage

Add to your model:
```ruby
class Company < ApplicationRecord
  validates :vat_number, cvr: true
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_cvr'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install validates_cvr
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

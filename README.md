# Technical Exercise - FizzBuzz

This exercise creates a simple API serving FizzBuzz numbers and lets users play through the console


## Installation

* Install dependencies:

  ```
  $ bundle install
  ```

  Under ui directory (Python 2.7 required)
  ```
  pip install -r requirements.txt    | if using virtualenv
  or python -m pip install requests  | without
  ```

## Usage

Start the ui by running:

  ```
  $ python fizz_ui.py
  ```

Start the Rails API on port 3000:

  ```
  $ rails s -p 3000
  ```

## Database

Set up the db by running:

  ```
  $ bundle exec rake db:migrate
  ```

## Testing

Unit tests are implemented with RSpec:

  ```
  $ bundle exec rspec
  ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/saurabh-bhatt/fizzbuzz.

## License

This code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

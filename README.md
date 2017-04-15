# AwesomeUse

[![Code Climate](https://codeclimate.com/github/brainagency/awesome_use/badges/gpa.svg)](https://codeclimate.com/github/brainagency/awesome_use)

Helps you to avoid the usages of long namespaces when you use some class inside another one.
Actually this approach (I mean which gem provides) isn't so good and could be doubted. But it is a
result of a small experiment and as a result of a fun hacking session with my legacy code base you
see this gem.

Mostly an idea is borrowed from Elixir language, when instead writing like this:

```elixir
defmodule MyModuleB do
  def call do
    A.Very.Long.Namespace.MyModuleA.call
  end
end
```

you can write just like this:

```elixir
defmodule MyModuleB do
  alias A.Very.Long.Namespace.MyModuleA

  def call do
    MyModuleA.call
  end
end
```

And code in the second example has some benefits:

* consumer's function code is more readable.
* at now consumer's module has a list of dependencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awesome_use'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awesome_use

## Usage

For example, we have such class definition:

```ruby
module Api
  module V1
    module Pages
      class IndexOperation
        def call
          #...
        end
      end
    end
  end
end
```

And this class is used inside an appropriate controller:

```ruby
class PagesController < ...
  def index
    operation_result = Api::V1::Pages::IndexOperation.call
    #...
  end
end
```

But with this gem you can rewrite the above example like this:

```ruby
use Api::V1::Pages::IndexOperation

class PagesController < ...
  def index
    operation_result = IndexOperation.call
    #...
  end
end
```

and that's it.

Also a very good point to see all available behaviours is to observe `spec/awesome_use_spec.rb` file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brainagency/awesome_use. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


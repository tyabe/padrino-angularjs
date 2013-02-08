# Padrino AngularJS

This gem wraps the [Andular.js](http://angularjs.org/) library for use in Padrino and above.

## Installation

Add this line to your application's Gemfile:

    gem 'padrino-angularjs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install padrino-angularjs

## Usage

Install Angular.js library for your app:

    $ padrino g angularjs_install

Options|Default|Aliases|Description
-------|-------|-------|-----------
root   |.      |-r     |specify the root destination path
app    |/app   |-a     |specify the application
destroy|false  |-d     |removes all generated files

You'll be ready to go!

If you require optional angular files, you may include them as well in your Javascript manifest file (*app*/assets/javascripts/application.js)  
For example:

    //= require angular-resource

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

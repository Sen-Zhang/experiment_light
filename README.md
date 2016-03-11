# ExperimentLight

[![Code Climate](https://codeclimate.com/github/Sen-Zhang/experiment_light/badges/gpa.svg)](https://codeclimate.com/github/Sen-Zhang/experiment_light)
[![Build Status](https://travis-ci.org/Sen-Zhang/experiment_light.svg)](https://travis-ci.org/Sen-Zhang/experiment_light)
[![Gem Version](https://badge.fury.io/rb/experiment_light.svg)](http://badge.fury.io/rb/experiment_light)

Turn features on or off in various rails environments

> This gem is no longer maintained. Please try my refined feature toggle engine [simple_switch](https://github.com/Sen-Zhang/simple_switch).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'experiment_light'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install experiment_light

## Usage

### Basic

Run install generator:

    $ rails generate experiment_light:install

A yaml file named `experiment.yml` will be added into `config/` after running install generator, now your can define your experimental features:

    foo:
        development: true
        test: true
        production: false

    bar:
        development: false
        test: true
        production: false

Now you can use it in models like this:

    class TestModel < ActiveRecord::Base
      ...

      if experiment_on?(:foo)
        def foo_method
          ...
        end
      end

      ...
    end

In controllers like this:

    class TestController < ApplicationController
      ...

      def index
        ...

        if experiment_on?(:foo)
          redirect_to :back
        end

        ...
      end

      ...
    end

And in views like this:

    <% if experiment_on?(:foo) %>
        <p>Experiment foo is on</p>
    <% end %>

    <% if experiment_off?(:bar) %>
        <p>Experiment bar is off</p>
    <% end %>

### Toggel feature from view

Run install generator:

    $ rails generate experiment_light:install_toggle

- A controller file named `experiments_controller.rb` will be added into `app/controllers`
- A view template file name 'index.html.erb' will be added into `app/views/experiments`
- The following two routes will be added:

  ```ruby
  get 'experiments' => 'experiments#index'
  post 'update_experiment' => 'experiments#update'
  ```
You may want to customize the newly generated files base on your need. Now you are ready to go to `localhost:3000/experiments` to check out and toggle your features.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/experiment_light/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Experiment::Light

Turn features on or off in various rails environments

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

Now you can use it in your views like this:

    <% if ExperimentLight::Experiment.on?(:foo) %>
        <p>Experiment foo is on</p>
    <% end %>

    <% if ExperimentLight::Experiment.off?(:bar) %>
        <p>Experiment bar is off</p>
    <% end %>

## Contributing

1. Fork it ( https://github.com/[my-github-username]/experiment_light/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

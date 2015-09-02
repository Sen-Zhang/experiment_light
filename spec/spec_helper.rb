require 'bundler/setup'
require 'experiment_light'

Bundler.setup

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.order = :random

  config.before :each do
    # reset experiment.yml
    File.open('spec/config/experiment.yml', 'w') do |f|
      init_hash = HashWithIndifferentAccess.new({
        foo: {
          development: true,
          test: true,
          production: false
        },
        bar: {
          development: true,
          test: false,
          production: true
        }
      })

      f.puts init_hash.to_hash.to_yaml
    end

    allow(ExperimentLight::Experiment).to receive(:file_path).and_return('spec/config/experiment.yml')
    ExperimentLight::Experiment.send(:reload!)
  end
end

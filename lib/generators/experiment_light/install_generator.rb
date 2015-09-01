require 'rails/generators/base'

module ExperimentLight
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Copy experiment_sample.yml files to your application.'

      def copy_initializer
        template 'experiment_sample.yml', 'config/experiment.yml'
      end
    end
  end
end

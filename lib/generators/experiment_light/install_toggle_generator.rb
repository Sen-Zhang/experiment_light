require 'rails/generators/base'

module ExperimentLight
  module Generators
    class InstallToggleGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Copy experiment_sample.yml files to your application.'

      def copy_initializer
        copy_file 'experiments_controller.rb', 'app/controllers/experiments_controller.rb'
        copy_file 'index.html.erb', 'app/views/experiments/index.html.erb'

        route "get 'experiments' => 'experiments#index'"
        route "post 'update_experiment' => 'experiments#update'"
      end
    end
  end
end

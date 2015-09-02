require 'active_record'

module ExperimentLight
  class ActiveRecord::Base

    class << self
      def experiment_on?(experiment_name)
        ExperimentLight::Experiment.on?(experiment_name)
      end

      def experiment_off?(experiment_name)
        !experiment_on?(experiment_name)
      end
    end

  end
end

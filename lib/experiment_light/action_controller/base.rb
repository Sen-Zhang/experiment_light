require 'action_controller'

module ExperimentLight
  class ActionController::Base

    def experiment_on?(experiment_name)
      ExperimentLight::Experiment.on?(experiment_name)
    end

    def experiment_off?(experiment_name)
      !experiment_on?(experiment_name)
    end

    helper_method :experiment_on?, :experiment_off?
  end
end

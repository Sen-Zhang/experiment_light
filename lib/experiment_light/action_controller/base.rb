require 'action_controller'

module ExperimentLight
  class ActionController::Base
    include ExperimentLight::HelperMethods

    def experiment_data
      ExperimentLight::Experiment.experiment_feature_data
    end

    def toggle_feature(experiment, env, value)
      ExperimentLight::Experiment.update(experiment, env, value)
    end

    helper_method :experiment_on?, :experiment_off?
  end
end

module ExperimentLight
  module HelperMethods

    def experiment_on?(experiment_name)
      ExperimentLight::Experiment.on?(experiment_name)
    end

    def experiment_off?(experiment_name)
      !experiment_on?(experiment_name)
    end

  end
end

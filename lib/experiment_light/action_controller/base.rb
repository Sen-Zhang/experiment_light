require 'action_controller'

module ExperimentLight
  class ActionController::Base
    include ExperimentLight::HelperMethods

    helper_method :experiment_on?, :experiment_off?
  end
end

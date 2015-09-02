require 'active_record'

module ExperimentLight
  class ActiveRecord::Base
    extend ExperimentLight::HelperMethods
  end
end

class ExperimentLight::Experiment
  class << self
    def on?(experiment_name)
      experiment_feature_data

      reload! unless @experiment_data.has_key?(experiment_name)

      unless @experiment_data.has_key?(experiment_name)
        raise "Cannot find experiment '#{experiment_name}', check out your experiment.yml file"
      end

      @experiment_data[experiment_name][Rails.env]
    end

    def off?(experiment_name)
      !on?(experiment_name)
    end

    private
    def default_experiment_file_name
      'experiment.yml'
    end

    def load(file_name)
      file_path = Rails.root.join('config', file_name)
      HashWithIndifferentAccess.new(YAML::load(File.open(file_path)))
    end

    def reload!
      @experiment_data = load(default_experiment_file_name)
    end

    def experiment_feature_data
      @experiment_data ||= load(default_experiment_file_name)
    end
  end
end

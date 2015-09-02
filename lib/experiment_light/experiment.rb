class ExperimentLight::Experiment
  class << self
    def on?(experiment)
      experiment_feature_data

      @experiment_data[experiment][Rails.env] if valid_feature_name_and_env?(experiment)
    end

    def off?(experiment)
      !on?(experiment)
    end

    def update(experiment, env, value)
      experiment_feature_data

      @experiment_data[experiment][env] = value if valid_feature_name_and_env?(experiment, env)

      save_to_yaml
    end

    def delete(experiment)
      experiment_feature_data

      @experiment_data.delete(experiment) if valid_feature_name?(experiment)

      save_to_yaml
    end

    private
    def experiment_file_name
      'experiment.yml'
    end

    def file_path(file_name)
      Rails.root.join('config', file_name)
    end

    def load(file_name)
      HashWithIndifferentAccess.new(YAML::load(File.open(file_path(file_name))))
    end

    def reload!
      @experiment_data = load(experiment_file_name)
    end

    def experiment_feature_data
      @experiment_data ||= load(experiment_file_name)
    end

    def save_to_yaml
      File.open(file_path(experiment_file_name), 'w') do |f|
        f.puts @experiment_data.to_hash.to_yaml
      end

      true
    end

    def valid_feature_name?(experiment)
      reload! unless @experiment_data.has_key?(experiment)

      unless @experiment_data.has_key?(experiment)
        raise "Cannot find experiment '#{experiment}', check out your #{experiment_file_name} file"
      end

      true
    end

    def valid_feature_name_and_env?(experiment, env=Rails.env)
      valid_feature_name?(experiment)

      unless @experiment_data[experiment].has_key?(env)
        raise "Cannot find environment '#{env}' for experiment '#{experiment}', check out your #{experiment_file_name} file"
      end

      true
    end
  end
end

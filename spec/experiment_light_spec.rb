require 'spec_helper'

describe 'ExperimentLight' do
  describe 'Experiment' do
    it 'on? works fine' do
      allow(Rails).to receive(:env).and_return('development')

      expect(ExperimentLight::Experiment.on?(:foo)).to be_truthy
      expect(ExperimentLight::Experiment.on?(:bar)).to be_truthy

      allow(Rails).to receive(:env).and_return('test')

      expect(ExperimentLight::Experiment.on?(:foo)).to be_truthy
      expect(ExperimentLight::Experiment.on?(:bar)).to be_falsey

      allow(Rails).to receive(:env).and_return('production')

      expect(ExperimentLight::Experiment.on?(:foo)).to be_falsey
      expect(ExperimentLight::Experiment.on?(:bar)).to be_truthy

      expect(ExperimentLight::Experiment.on?(:foo, :development)).to be_truthy
      expect(ExperimentLight::Experiment.on?(:bar, :development)).to be_truthy

      expect(ExperimentLight::Experiment.on?(:foo, :test)).to be_truthy
      expect(ExperimentLight::Experiment.on?(:bar, :test)).to be_falsey

      expect(ExperimentLight::Experiment.on?(:foo, :production)).to be_falsey
      expect(ExperimentLight::Experiment.on?(:bar, :production)).to be_truthy
    end

    it 'off? works fine' do
      allow(Rails).to receive(:env).and_return('development')

      expect(ExperimentLight::Experiment.off?(:foo)).to be_falsey
      expect(ExperimentLight::Experiment.off?(:bar)).to be_falsey

      allow(Rails).to receive(:env).and_return('test')

      expect(ExperimentLight::Experiment.off?(:foo)).to be_falsey
      expect(ExperimentLight::Experiment.off?(:bar)).to be_truthy

      allow(Rails).to receive(:env).and_return('production')

      expect(ExperimentLight::Experiment.off?(:foo)).to be_truthy
      expect(ExperimentLight::Experiment.off?(:bar)).to be_falsey

      expect(ExperimentLight::Experiment.off?(:foo, :development)).to be_falsey
      expect(ExperimentLight::Experiment.off?(:bar, :development)).to be_falsey

      expect(ExperimentLight::Experiment.off?(:foo, :test)).to be_falsey
      expect(ExperimentLight::Experiment.off?(:bar, :test)).to be_truthy

      expect(ExperimentLight::Experiment.off?(:foo, :production)).to be_truthy
      expect(ExperimentLight::Experiment.off?(:bar, :production)).to be_falsey
    end

    it 'update works fine' do
      expect(ExperimentLight::Experiment.on?(:foo, :development)).to be_truthy

      ExperimentLight::Experiment.update(:foo, :development, false)

      expect(ExperimentLight::Experiment.off?(:foo, :development)).to be_truthy

      expect(ExperimentLight::Experiment.off?(:bar, :test)).to be_truthy

      ExperimentLight::Experiment.update(:bar, :test, true)

      expect(ExperimentLight::Experiment.on?(:bar, :test)).to be_truthy
    end

    it 'delete works fine' do
      expect(ExperimentLight::Experiment.on?(:foo, :development)).to be_truthy

      ExperimentLight::Experiment.delete(:foo)

      expect {
        ExperimentLight::Experiment.on?(:foo, :development)
      }.to raise_error(RuntimeError, "Cannot find experiment 'foo', check out your experiment.yml file")
    end

    it 'raise errors correctly' do
      expect {
        ExperimentLight::Experiment.update(:foobar, :development, false)
      }.to raise_error(RuntimeError, "Cannot find experiment 'foobar', check out your experiment.yml file")

      expect {
        ExperimentLight::Experiment.update(:foo, :dev, false)
      }.to raise_error(RuntimeError, "Cannot find environment 'dev' for experiment 'foo', check out your experiment.yml file")
    end
  end
end
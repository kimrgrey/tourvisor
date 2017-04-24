require 'spec_helper'

RSpec.describe Tourvisor::Configuration do
  let(:params) do
    {}
  end

  subject { described_class.new(**params) }

  it 'creates configuration object with default values' do
    expect(subject.base_url).to eq(Tourvisor::Configuration::DEFAULT_BASE_URL)
    expect(subject.format).to eq(Tourvisor::Configuration::DEFAULT_FORMAT)
  end

  context 'when login and password are specified' do
    let(:params) do
      {
        login: 'login',
        password: 'password'
      }
    end

    it 'creates configuration object with specified values' do
      expect(subject.base_url).to eq(Tourvisor::Configuration::DEFAULT_BASE_URL)
      expect(subject.format).to eq(Tourvisor::Configuration::DEFAULT_FORMAT)
      expect(subject.login).to eq(params[:login])
      expect(subject.password).to eq(params[:password])
    end
  end

  context 'when default values are overridden by params' do
    let(:params) do
      {
        format: 'xml'
      }
    end

    it 'creates configuration object with specified values' do
      expect(subject.base_url).to eq(Tourvisor::Configuration::DEFAULT_BASE_URL)
      expect(subject.format).to eq(params[:format])
    end
  end
end

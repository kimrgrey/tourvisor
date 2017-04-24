require 'spec_helper'

RSpec.describe Tourvisor do
  describe '.configure' do
    it 'allows to create configuration object and pass it into the block' do
      expect { |b| described_class.configure(&b) }.to yield_with_args(described_class.config)
    end
  end

  describe '.config' do
    it 'creates configuration object only once' do
      c_1 = described_class.config
      c_2 = described_class.config

      expect(c_1).to eql(c_2)
    end
  end
end

require 'spec_helper'

RSpec.describe Tourvisor do
  it 'defines VERSION' do
    expect(described_class::VERSION).not_to be_empty
  end
end

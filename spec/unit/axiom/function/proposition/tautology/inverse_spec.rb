# encoding: utf-8

require 'spec_helper'

describe Function::Proposition::Tautology, '#inverse' do
  subject { object.inverse }

  let(:object) { described_class.instance }

  it_should_behave_like 'an invertible method'

  it { should equal(Function::Proposition::Contradiction.instance) }
end

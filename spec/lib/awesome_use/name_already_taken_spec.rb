require 'spec_helper'

describe AwesomeUse::NameAlreadyTaken do
  describe 'class' do
    subject { described_class }

    it 'has to be a subclass of a StandardError one' do
      ancestors = subject.ancestors
      expect(ancestors).to include(::StandardError)
    end
  end
end

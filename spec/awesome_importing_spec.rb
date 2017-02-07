require 'spec_helper'

describe AwesomeImporting do
  it 'provides config' do
    expect(AwesomeImporting.config).to be_kind_of AwesomeImporting::Config 
  end
end

require 'spec_helper'

describe AwesomeImporting::Config do
  it { is_expected.to respond_to :strict_collision_checking }
  it { is_expected.to respond_to :strict_collision_checking= }

  it { is_expected.to respond_to :logger }
  it { is_expected.to respond_to :logger= }
end

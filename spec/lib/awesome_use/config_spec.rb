require 'spec_helper'

describe AwesomeUse::Config do
  it { is_expected.to respond_to :strict_collision_checking }
  it { is_expected.to respond_to :strict_collision_checking= }

  it { is_expected.to respond_to :logger }
  it { is_expected.to respond_to :logger= }
end

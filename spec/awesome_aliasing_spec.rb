require 'spec_helper'

module Api
  module V1
    class IndexOperation
    end
  end
end

module Api
  module V1
    class ShowOperation
    end
  end
end

class ShowOperation
end

describe AwesomeAliasing do
  it 'provides config' do
    expect(AwesomeAliasing.config).to be_kind_of AwesomeAliasing::Config 
  end

  describe 'aliasing logic' do
    context 'WHEN aliasing uniq class' do
      it 'does not raise an exception' do
        self.send :include, AwesomeAliasing::ObjectUtils
        expect{
          aliasing Api::V1::IndexOperation
        }.to_not raise_error

        expect(IndexOperation.name).to eq "Api::V1::IndexOperation"
      end
    end

    describe 'WHEN aliasing a class which name does not uniq' do
      context 'AND strict collision checking is on' do
        before do
          AwesomeAliasing.config.strict_collision_checking = true
        end

        after do
          AwesomeAliasing.config.strict_collision_checking = false
        end

        it 'raises exception AwesomeAliasing::NameAlreadyTaken' do
          self.send :include, AwesomeAliasing::ObjectUtils
          expect{
            aliasing Api::V1::ShowOperation
          }.to raise_error(AwesomeAliasing::NameAlreadyTaken)
        end
      end

      context 'AND strict collision checking is off' do
        before do
          @_old_collision_checking_status = AwesomeAliasing.config.strict_collision_checking
          AwesomeAliasing.config.strict_collision_checking = false
        end

        after do
          AwesomeAliasing.config.strict_collision_checking = @_old_collision_checking_status
        end

        it 'does not raises exception' do
          self.send :include, AwesomeAliasing::ObjectUtils
          expect{
            aliasing Api::V1::ShowOperation
          }.to_not raise_error

          expect(ShowOperation.name).to eq "Api::V1::ShowOperation"
        end
      end

      context 'AND specifing another name' do
        before do
          AwesomeAliasing.config.strict_collision_checking = true
        end

        after do
          AwesomeAliasing.config.strict_collision_checking = false
        end

        it 'does not raises exception', :focus do
          self.send :include, AwesomeAliasing::ObjectUtils
          expect{
            aliasing Api::V1::ShowOperation, as: "MyShowOperation"
          }.to_not raise_error

          expect(MyShowOperation.name).to eq "Api::V1::ShowOperation"
        end
      end
    end
  end
end

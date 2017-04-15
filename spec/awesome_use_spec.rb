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

describe AwesomeUse do
  it 'provides config' do
    expect(AwesomeUse.config).to be_kind_of AwesomeUse::Config 
  end

  describe 'use logic' do
    context 'WHEN use uniq class' do
      it 'does not raise an exception' do
        self.send :include, AwesomeUse::ObjectUtils
        expect{
          use Api::V1::IndexOperation
        }.to_not raise_error

        expect(IndexOperation.name).to eq "Api::V1::IndexOperation"
      end
    end

    describe 'WHEN use a class which name does not uniq' do
      context 'AND strict collision checking is on' do
        before do
          AwesomeUse.config.strict_collision_checking = true
        end

        after do
          AwesomeUse.config.strict_collision_checking = false
        end

        it 'raises exception AwesomeUse::NameAlreadyTaken' do
          self.send :include, AwesomeUse::ObjectUtils
          expect{
            use Api::V1::ShowOperation
          }.to raise_error(AwesomeUse::NameAlreadyTaken)
        end
      end

      context 'AND strict collision checking is off' do
        before do
          @_old_collision_checking_status = AwesomeUse.config.strict_collision_checking
          AwesomeUse.config.strict_collision_checking = false
        end

        after do
          AwesomeUse.config.strict_collision_checking = @_old_collision_checking_status
        end

        it 'does not raises exception' do
          self.send :include, AwesomeUse::ObjectUtils
          expect{
            use Api::V1::ShowOperation
          }.to_not raise_error

          expect(ShowOperation.name).to eq "Api::V1::ShowOperation"
        end
      end

      context 'AND specifing another name' do
        before do
          AwesomeUse.config.strict_collision_checking = true
        end

        after do
          AwesomeUse.config.strict_collision_checking = false
        end

        it 'does not raises exception', :focus do
          self.send :include, AwesomeUse::ObjectUtils
          expect{
            use Api::V1::ShowOperation, as: "MyShowOperation"
          }.to_not raise_error

          expect(MyShowOperation.name).to eq "Api::V1::ShowOperation"
        end
      end
    end
  end
end

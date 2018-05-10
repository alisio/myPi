require 'spec_helper'
describe 'myPi' do
  context 'with default values for all parameters' do
    it { should contain_class('myPi') }
  end
end

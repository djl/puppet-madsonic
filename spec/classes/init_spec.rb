require 'spec_helper'
describe 'madsonic' do

  context 'with defaults for all parameters' do
    it { should contain_class('madsonic') }
  end
end

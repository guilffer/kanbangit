require 'helper'
require 'kanbangit/environment'
require 'kanbangit/command/init'

describe Kanbangit::Command::Init do
  let(:env) { Kanbangit::Environment.new } 
  let(:instance) { described_class.new([], env) }
  subject { instance.execute.to_s }

  context 'when items_path does not exist' do
    it { should == File.expand_path(env.items_path) }
  end

  context 'when items_path already exists' do
    before { FileUtils.mkdir_p env.items_path }
    it { should == 'Already a kanbangit repository' }
  end
end

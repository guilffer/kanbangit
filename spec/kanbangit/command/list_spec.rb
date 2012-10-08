require 'helper'
require 'kanbangit/environment'
require 'kanbangit/command/list'

describe Kanbangit::Command::List do
  let(:env) { Kanbangit::Environment.new }
  let(:instance) { described_class.new([], env) }
  subject { instance.execute }

  context 'when items_path does not exist' do
    it { should == 'Not a kanbangit repository' }
  end

  context 'when items_path already exists' do
    before { FileUtils.mkdir_p env.items_path }
    it { should == "[todo]\n\n[doing]\n\n[done]\n\n" }
  end
end
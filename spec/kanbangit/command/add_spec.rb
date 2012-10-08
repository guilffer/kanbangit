require 'helper'
require 'kanbangit/environment'
require 'kanbangit/command/add'

describe Kanbangit::Command::Add do
  let(:env) { Kanbangit::Environment.new }
  let(:instance) { described_class.new(['nome'], env) }
  subject { instance.execute }

  context 'when items_path does not exist' do
    it { should == 'Not a kanbangit repository' }
  end

  context 'when items_path already exists' do
    before { FileUtils.mkdir_p env.items_path }
    it { should == 'nome added to column todo' }
  end
end

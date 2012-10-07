require 'helper'
require 'kanbangit/environment'
require 'kanbangit/cli'

describe Kanbangit::Command::Init do
  let(:env) { Kanbangit::Environment.new } 
  let(:instance) { described_class.new([], env) }
  
  context 'when the items_path does not exist in the file system' do
    it 'should create the path' do 
      instance.execute
      Dir.exists?(env.items_path).should be_true
    end
  end
  
  context 'when the items_path already exists in the file system' do
    it 'should notify the user' do 
      FileUtils.mkdir_p env.items_path
      instance.execute.should eq('Already a kanbangit repository')
    end
  end
end

describe Kanbangit::Command::Add do
  let(:env) { Kanbangit::Environment.new }
  let(:instance) { described_class.new(['nome'], env) }
  
  context 'when there is no items_path in the file system' do
    it 'should notify the user' do
      instance.execute.should eq('Not a kanbangit repository')
    end
  end

  context 'when the items_path already exists in the file system' do
    it "should add items to the kanban" do 
      FileUtils.mkdir_p env.items_path
      instance.execute.should eq('nome added to column todo')
    end
  end
end

describe Kanbangit::Command::List do
  let(:env) { Kanbangit::Environment.new }
  let(:instance) { described_class.new([], env) }
  
  context 'when there is no items_path in the file system' do
    it 'should notify the user' do 
      instance.execute.should eq('Not a kanbangit repository')
    end
  end
  
  context 'when the items_path already exists in the file system' do
    it "should list all the items under the kanban in a pretty way" do
      FileUtils.mkdir_p env.items_path
      instance.execute.should eq("[todo]\n\n[doing]\n\n[done]\n\n")
    end
  end
end
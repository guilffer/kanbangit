require 'kanbangit/item'
require 'kanbangit/environment'
require 'helper'

describe Kanbangit::Item do
  let(:env) {Kanbangit::Environment.new('/')}
  let!(:instance) {described_class.new('nome', env)}
  after { FileUtils.rm(instance.itemfile_path) }

  describe '.name' do 
    it { instance.name.should == 'nome' }
  end

  it "is associated to a .yml file" do 
    File.exists?(instance.itemfile_path).should be_true
  end

  describe '.column' do
    it { instance.column.should == 'todo' }
  end

  its "file knows the currrent column" do 
    item_file = YAML.load_file instance.itemfile_path
    item_file['column'].should eq('todo')
  end

  context "when itemfile already exists" do
    let(:file_path) {File.join(env.items_path,'doing_item.yml')}
    before { File.open(file_path, 'w') {|f| f.write({'column'=>'doing'}.to_yaml)} }
    after { FileUtils.rm file_path }
    
    its "file isn't rewrite" do 
      item = Kanbangit::Item.new('doing_item', env)
      item_file = YAML.load_file file_path
      item_file['column'].should == 'doing'
    end

    it "loads the itemfile" do 
      item = Kanbangit::Item.new('doing_item', env)
      item.column.should == 'doing'
    end
  end
  
  describe ".update" do
    it "update the item data" do 
      instance.update :column, "done"
      instance.column.should == "done"
    end
    
    it "update the itemfile" do 
      instance.update :column, "done"
      item_file = YAML.load_file instance.itemfile_path
      item_file['column'].should == 'done'
    end
  end

end
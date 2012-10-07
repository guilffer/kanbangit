require 'kanbangit/item'
require 'kanbangit/environment'
require 'helper'

describe Kanbangit::Item do

  let(:env) {Kanbangit::Environment.new('/')}
  let!(:instance) {described_class.new('nome', env)}
  after(:each) { FileUtils.rm(instance.itemfile_path) }

  it "has a attribute name" do
    instance.name.should eq('nome')
  end

  it "is associated to a .yml file" do 
    File.exists?(instance.itemfile_path).should be_true
  end

  it "should start at kanban's first column" do
    instance.column.should eq('todo')
  end

  it "'s file should have the currrent column infomation" do 
    item_file = YAML.load_file instance.itemfile_path
    item_file['column'].should eq('todo')
  end

  it "'s file should not be rewrote if it already exists" do 
    file_path = File.join(env.items_path,'doing_item.yml')
    File.open file_path, 'w' do |file|
      file.write({'column'=>'doing'}.to_yaml)
    end

    item = Kanbangit::Item.new('doing_item', env)

    item_file = YAML.load_file file_path
    item_file['column'].should eq('doing')

    FileUtils.rm(file_path)
  end

  it "should load the file information if it already exists" do 
    file_path = File.join(env.items_path,'doing_item.yml')
    File.open file_path, 'w' do |file|
      file.write({'column'=>'doing'}.to_yaml)
    end

    item = Kanbangit::Item.new('doing_item',env)

    item.column.should eq('doing')

    FileUtils.rm(file_path)
  end

end
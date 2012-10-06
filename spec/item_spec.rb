require 'item'
require 'helper'

describe "#item" do

  before(:each) do 
    @item = Item.new 'nome'
  end

  after(:each) do 
    FileUtils.rm(ENV['ITEMS_PATH']+'nome.yml')
  end

  it "has a attribute name" do
    @item.name.should eq('nome')
  end

  it "is associated to a .yml file" do 
    File.exists?(ENV['ITEMS_PATH']+'nome.yml').should be_true
  end

  it "should start at kanban's first column" do
    @item.column.should eq('todo')
  end

  it "'s file should have the currrent column infomation" do 
    item_file = YAML.load_file ENV['ITEMS_PATH']+'nome.yml'
    item_file['column'].should eq('todo')
  end

  it "'s file should not be rewrote if it already exists" do 
    file_path = ENV['ITEMS_PATH']+'doing_item.yml'
    File.open file_path, 'w' do |file|
      file.write({'column'=>'doing'}.to_yaml)
    end

    item = Item.new 'doing_item'

    item_file = YAML.load_file file_path
    item_file['column'].should eq('doing')

    FileUtils.rm(file_path)
  end

  it "should load the file information if it already exists" do 
    file_path = ENV['ITEMS_PATH']+'doing_item.yml'
    File.open file_path, 'w' do |file|
      file.write({'column'=>'doing'}.to_yaml)
    end

    item = Item.new 'doing_item'

    item.column.should eq('doing')

    FileUtils.rm(file_path)
  end

end
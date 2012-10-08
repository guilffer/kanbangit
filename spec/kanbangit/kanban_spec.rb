require 'helper'
require 'kanbangit/environment'
require 'kanbangit/kanban'
require 'kanbangit/item'

describe Kanbangit::Kanban do

  let(:env) {Kanbangit::Environment.new('/')}
  let(:instance) { described_class.new env }
  let!(:item1) { Kanbangit::Item.new("item1",env) }
  let!(:item2) { Kanbangit::Item.new("item2",env) }
  
  it "has a list of items" do
    instance.items << item1
    instance.items << item2

    instance.items.should eq([item1, item2])
  end

  it "loads items from file system" do
    instance.load_items_from_fs!

    instance.items.size.should eq(2)
    instance.items[0].name.should eq(item1.name)
    instance.items[1].name.should eq(item2.name)
  end

  it "shows the items in a pretty way" do
    expected  = "[todo]\n"
    expected << "- item1\n"
    expected << "- item2\n"
    expected << "\n"
    expected << "[doing]\n"
    expected << "\n"
    expected << "[done]\n"
    expected << "\n"
  
    instance.load_items_from_fs!
    instance.pretty_print.should eq(expected)
  end
  
end
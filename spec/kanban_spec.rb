require 'helper'
require 'kanban'
require 'item'

describe "#kanban" do
  
  before(:each) do
    @kanban = Kanban.new
    @item1 = Item.new "item1"
    @item2 = Item.new "item2"
  end

  it "should have a list of items" do
    @kanban.items << @item1
    @kanban.items << @item2
    
    @kanban.items.should eq([@item1, @item2])
  end
  
  it "should load items from FS" do
    @kanban.load_items_from_fs!
    
    @kanban.items.size.should eq(2)
    @kanban.items[0].name.should eq(@item1.name)
    @kanban.items[1].name.should eq(@item2.name)
  end
  
  it "should show the items in a pretty way" do
    expected  = "[todo]\n"
    expected << "- item1\n"
    expected << "- item2\n"
    expected << "\n"
    expected << "[doing]\n"
    expected << "\n"
    expected << "[done]\n"
    expected << "\n"
    
    @kanban.load_items_from_fs!
    
    @kanban.pretty_print.should eq(expected)
  end

end
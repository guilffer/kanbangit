require 'item'
require 'helper'

describe "#item" do

  before(:all) do
    Item::BASE_PATH = ''
  end

	it "has a attribute name" do
		item = Item.new 'nome'
		item.name.should eq('nome')
	end
	
	it "should be associated to a file" do 
  	item = Item.new 'nome'
  	File.exists?(Item::BASE_PATH+'nome').should eq(true)
  end

end
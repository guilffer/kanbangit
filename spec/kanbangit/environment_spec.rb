require 'helper'
require 'kanbangit/environment'

describe Kanbangit::Environment do
  let(:instance) {described_class.new 'items/path'}  
  
  it "knows where to put the itemfiles" do 
    instance.items_path.should eq('items/path')
  end
end
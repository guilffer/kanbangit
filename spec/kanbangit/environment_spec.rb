require 'helper'
require 'kanbangit/environment'

describe Kanbangit::Environment do
  let(:instance) {described_class.new}  
  
  it "have the items directory path" do 
    instance.items_path.should eq('.kanban/items')
  end
  
end
require 'helper'
require 'kanbangit'

describe "#kanbangit" do

  it "should add items to the kanban" do 
    Kanbangit.app('add', 'nome')
    File.exists?(ENV['ITEMS_PATH']+'nome.yml').should be_true
  end

  it "should list all the items under the kanban in a pretty way" do
    Kanbangit.app('list').gsub(/\n| /,'').should eq('[todo][doing][done]')
  end

end
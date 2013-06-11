require 'helper'
require 'kanbangit/environment'
require 'kanbangit/command/help'

describe Kanbangit::Command::Help do
  let(:env) { Kanbangit::Environment.new }
  let(:instance) { described_class.new(nil, env) }
  subject { instance.execute }

  it { should == 'add, forward, help, init, list' }

 end 
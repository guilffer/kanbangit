require 'kanbangit/cli'

module Kanbangit
  class Environment
    
    attr_reader :items_path
    
    def initialize (items_path = '.kanban/items')
      @items_path = items_path
      @cli = CLI.new self
    end
    
    def cli(argv)
     @cli.execute(*argv)
    end
  end
  
end
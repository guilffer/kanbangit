require 'kanbangit/command'
require 'kanbangit/item'

module Kanbangit
  module Command
    
    class Add < Command
      def execute
        if Dir.exists? @env.items_path
          item = Item.new(@argv[0], @env)
          "#{item.name} added to column #{item.column}"
        else
          'Not a kanbangit repository'
        end
      end
    end
    
  end
end
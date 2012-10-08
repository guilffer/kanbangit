require 'kanbangit/command'
require 'kanbangit/item'
require 'kanbangit/kanban'

module Kanbangit
  module Command
    
    class Forward < Command
      def execute
        if Dir.exists? @env.items_path
          item = Item.new(@argv[0], @env)
          kanban = Kanban.new(@env)
          kanban.forward item
          "#{item.name} added to column #{item.column}"
        else
          'Not a kanbangit repository'
        end
      end
    end
    
  end
end
require 'kanbangit/item'
require 'kanbangit/kanban'

class Kanbangit
  
  def self.app (*args)
    case args[0].to_sym
    when :add
      add args[1]
    when :list
      list
    end
  end
  
  def self.add (item_name)
    Item.new item_name
  end
  
  def self.list
    kanban = Kanban.new
    kanban.load_items_from_fs!
    kanban.pretty_print
  end

end
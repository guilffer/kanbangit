require 'kanban'
require 'test/unit'

class KanbanTest < Test::Unit::TestCase

	def test_list_itens
		kanban = Kanban.new
		list = kanban.list_itens
	end

end
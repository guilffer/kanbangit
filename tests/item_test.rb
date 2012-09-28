require 'item'
require 'test/unit'

class ItemTest < Test::Unit::TestCase
	
	def test_create
		item = Item.new "nome"
		assert_equal "nome", item.name
	end

	def test_create_should_touch_file
		item = Item.new "nome"
		assert_equal "nome", item.name
	end

end
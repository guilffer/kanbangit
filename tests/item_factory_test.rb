require 'item_factory'
require 'item'
require 'test/unit'

class ItemFactoryTest < Test::Unit::TestCase
	
	def test_create_item
		item = ItemFactory.create "nome"
		assert File.exists? ItemFactory.base_path + item.name
	end

end
class Item

	BASE_PATH = ".kanban/itens/"
	attr_reader :name

	def initialize(name)
		@name = name
		File.new BASE_PATH + name, "w"
	end

end
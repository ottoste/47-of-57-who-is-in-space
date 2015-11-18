defmodule WhoIsInSpace do

	def main do
		GetAstronauts.list_of_astronauts
		|> BuildTable.nice_table
		|> IO.puts
	end
end

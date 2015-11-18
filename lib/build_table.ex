defmodule BuildTable do

	def add_header(rows) do
		header = ["Name", "Craft"]
		List.insert_at(rows, 0, header)
	end

	def get_columns(values_on_rows) do
		List.zip(values_on_rows)
		|>Enum.map(fn(x) -> 
			Tuple.to_list(x) 
		end)
	end

	def find_longest_element(column) do
		Enum.max_by(column, fn(x) ->
			String.length(x)
		end)
		|>String.length
	end

	def set_width_of_column(column) do
		Enum.map(column, fn(x) ->
			String.ljust(x, find_longest_element(column) + 1)
		end)
	end

	def set_width_of_all_columns(columns) do
		Enum.map(columns, fn(x) ->
			set_width_of_column(x)
		end)
	end

	def create_new_rows(new_columns) do
		List.zip(new_columns)
		|>Enum.map(fn(x) -> 
			Tuple.to_list(x) 
		end)
		|> Enum.map(fn(x) -> List.insert_at(x, 1, "| ") end)
	end

	def build_dashed_row(rows) do
  	length = Enum.random(rows) |> List.to_string |> String.length
  	String.duplicate("-", length)
  	|> String.split
  end

  def add_dashed_line(rows) do
		dashed_line = build_dashed_row(rows)
		List.insert_at(rows, 1, dashed_line)
	end

	def readable_rows(rows) do
		Enum.map(rows, fn(x) ->
			List.to_string(x) <> "\n"
		end)
		|> List.to_string
		|> String.rstrip(?\n)
	end

	def nice_table(list_of_astronauts) do
		list_of_astronauts
		|> add_header
		|> get_columns
		|> set_width_of_all_columns
		|> create_new_rows
		|> add_dashed_line
		|> readable_rows
	end
end
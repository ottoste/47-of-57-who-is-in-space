defmodule BuildTableTest do
  use ExUnit.Case
  doctest BuildTable

  test "add header row" do
  	list = [["John", "ISS"], ["Lance", "Apollo"]]
  	result = [["Name", "Craft"], ["John", "ISS"], ["Lance", "Apollo"]]

  	assert BuildTable.add_header(list) == result
  end

  test "creates list of values in columns" do
  	list = [["John", "ISS"], ["Lance", "Apollo"]]
  	result = [["John", "Lance"], ["ISS", "Apollo"]]

    assert BuildTable.get_columns(list) == result
  end

	test "finds the length of the longest string of column" do
  	column = ["ISS", "Apollo"]
  	assert BuildTable.find_longest_element(column) == 6
  end

  test "sets length of every string in column to be max+1" do
  	column = ["ISS", "Apollo"]
  	assert BuildTable.set_width_of_column(column) == ["ISS    ", "Apollo "]
  end

  test "sets width of all columns according to each max" do
  	column = [["John", "Lance"], ["ISS", "Apollo"]]
  	assert BuildTable.set_width_of_all_columns(column) == [["John  ", "Lance "], ["ISS    ", "Apollo "]]
  end

  test "creates new rows and adds line between columns" do
  	column = [["John  ", "Lance "], ["ISS    ", "Apollo "]]
  	assert BuildTable.create_new_rows(column) == [["John  ", "| ", "ISS    "], ["Lance ", "| ", "Apollo "]]
  end

  test "adds dashed line after header" do
  	rows = [["Name  ", "Craft  "], ["John  ", "ISS    "], ["Lance ", "Apollo "]]
  	assert BuildTable.add_dashed_line(rows) ==[["Name  ", "Craft  "], ["-------------"], ["John  ", "ISS    "], ["Lance ", "Apollo "]]
  end

  test "makes readable rows" do
  	rows = [["Name  ", "Craft  "], ["-------------"], ["John  ", "ISS    "], ["Lance ", "Apollo "]]
  	assert BuildTable.readable_rows(rows) == "Name  Craft  \n-------------\nJohn  ISS    \nLance Apollo "
  end

end


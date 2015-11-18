defmodule GetAstronauts do
	
	def get_response_from_url(url) do
 		url
    |> HTTPotion.get
    |> get_response_body
    
  end
    
  def get_response_body(response) do
  	%HTTPotion.Response{body: body} = response
    body
  end

  def parse_to_list (json_file) do
		{:ok, %{"message" => message, "number" => number, "people" => people}} = Poison.decode(json_file)
		people
		|> Enum.map(fn(x) -> Map.values(x) end)
	end

  def reverse_name_and_craft(list) do
    Enum.map(list, fn(x) -> Enum.reverse(x) end)
  end

  def list_of_astronauts do
    "http://api.open-notify.org/astros.json"
    |> get_response_from_url
    |> parse_to_list
    |> reverse_name_and_craft
  end
end



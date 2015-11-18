defmodule GetAstronautsTest do
  use ExUnit.Case
  doctest GetAstronauts
 
  test "gets url body" do
    url = "http://api.open-notify.org/astros.json"
    result = GetAstronauts.get_response_from_url(url)
  
    assert String.contains?(result, "people") == true
  end

  test "decode the body to list of values" do
    input = "{\n  \"message\": \"success\", \n  \"number\": 6, \n  \"people\": [\n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Mikhail Kornienko\"\n    }, \n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Scott Kelly\"\n    }, \n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Oleg Kononenko\"\n    }, \n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Kimiya Yui\"\n    }, \n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Kjell Lindgren\"\n    }, \n    {\n      \"craft\": \"ISS\", \n      \"name\": \"Sergey Volkov\"\n    }\n  ]\n}"
    result = [["ISS", "Mikhail Kornienko"], ["ISS", "Scott Kelly"], ["ISS", "Oleg Kononenko"], ["ISS", "Kimiya Yui"], ["ISS", "Kjell Lindgren"], ["ISS", "Sergey Volkov"]]

    assert GetAstronauts.parse_to_list(input) == result
  end

  test "reverse name and craft inside lists" do
    list = [["ISS", "John"], ["ISS", "David"]]
    result = [["John", "ISS"], ["David", "ISS"]]

    assert GetAstronauts.reverse_name_and_craft(list) == result
  end

end
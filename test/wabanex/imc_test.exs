defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, return data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expect_response =
        {:ok,
         %{
           "Dani" => 23.437499999999996,
           "Diego" => 23.04002019946976,
           "Gabul" => 22.857142857142858,
           "Rafael" => 24.897060231734173,
           "Rodrigo" => 26.234567901234566
         }}

      assert response == expect_response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      expect_response = {:error, "Error while opening the file"}

      assert response == expect_response
    end
  end
end

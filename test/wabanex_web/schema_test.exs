defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "When a valid id is giver, return the user", %{conn: conn} do
      params = %{name: "Rodrigo", email: "rodrigo@test.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      {
        getUser(id: "#{user_id}") {
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "rodrigo@test.com",
            "name" => "Rodrigo"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, create the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "Rodrgigo2", email: "rodrigo2@rodrigo.com", password: "123456"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Rodrgigo2"}}} = response
    end
  end
end

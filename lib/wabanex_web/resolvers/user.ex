defmodule WabanexWeb.Resolvers.User do
  alias Wabanex.Users.Get, as: GetUser
  alias Wabanex.Users.Create, as: CreateUser

  def get(%{id: user_id}, _context), do: GetUser.call(user_id)
  def create(%{input: params}, _context), do: CreateUser.call(params)
end

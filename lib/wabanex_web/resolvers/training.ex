defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.Trainings.Create, as: CreateTraining

  def create(%{input: params}, _context), do: CreateTraining.call(params)
end

defmodule ToyRobot.Table do
  defstruct [:north_boundry, :east_boundry]

  alias ToyRobot.Table

  @doc """
  Determines if a position would be withinthe table's boundaries.

  ## Examples
    iex> alias ToyRobot.Table
    ToyRobot.Table
    iex> table = %Table{north_boundary: 4, east_boundry: 4}
  """
end

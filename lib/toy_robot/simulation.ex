defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Simulation, Table}
  defstruct [:table, :robot]

  @doc """
  Simulates placing a robot on a table

  ## Examples
  When the robot is placed in a valid position:
    iex>  alias ToyRobot.{Robot, Simulation, Table}
    [ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> Simulation.place(table, %{north: 0, east: 0, facing: :north})
    { :ok, %Simulation{table: table, robot: %Robot{north: 0, east: 0, facing: :north}}}

  When the robot  is placed in a invalid position:
    iex> alias ToyRobot.{Table, Simulation}
    [ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> Simulation.place(table, %{north: 6, east: 0, facing: :north})
    {:error, :invalid_placement}
  """

  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
      {:ok,
       %__MODULE__{
         table: table,
         robot: struct(Robot, placement)
       }}
    else
      {:error, :invalid_placement}
    end
  end

  @doc """

  Moves the robot forward one space in the direction that it is facing. unless
  that position is past the boundaries of the table

  ## Examples


  ### A valid movement

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> simulation = %Simulation{table: table, robot: %Robot{north: 0, east: 0, facing: :north}}
    iex> simulation |> Simulation.move
    {:ok, %Simulation{
      table: table,
      robot: %Robot{north: 1, east: 0, facing: :north}
    }}

  ### An invalid movement
  iex> alias ToyRobot.{Robot, Table, Simulation}
  [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
  iex> table = %Table{north_boundary: 4, east_boundary: 4}
  %Table{north_boundary: 4, east_boundary: 4}
  iex> simulation = %Simulation{table: table, robot: %Robot{north: 4, east: 0, facing: :north}}
  iex> simulation |> Simulation.move()
  {:error, :at_table_boundary}
  """

  def move(%Simulation{robot: robot, table: table} = simulation) do
    with moved_robot <- robot |> Robot.move,
                true <- table |> Table.valid_position?(moved_robot)
    do
      {:ok, %{simulation | robot: moved_robot}}
    else
      false -> {:error, :at_table_boundary}
    end

  end
end

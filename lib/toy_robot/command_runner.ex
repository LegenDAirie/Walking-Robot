defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([]), do: nil

  def run([{:place, placement} | rest]) do
    table = %Table{north_boundary: 4, east_boundary: 4}
    case Simulation.place(table, placement) do
      {:ok, simulation} -> simulation
      {:error, :invalid_placement} -> run(rest)
    end
  end
end

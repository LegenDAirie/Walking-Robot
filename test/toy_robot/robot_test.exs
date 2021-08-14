defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  doctest ToyRobot.Robot
  alias ToyRobot.Robot

  describe "When the robot is facing North" do
    setup do
      {:ok, %{robot: %Robot{north: 0, facing: :north}}}
    end

    test "It moves one space North", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
    end

    test "It turns left to face West", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :west
    end

    test "It turns right to face East", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :east
    end
  end

  describe "When the robot is facing North, and it has moved forward a space" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :north}}}
    end

    test "Turns right to face East", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :east
      assert robot.north == 1
    end

    test "Turns left to face West", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :west
      assert robot.north == 1
    end
  end

  describe "when the robot is facing North, and it has moved east once" do
    setup do
      {:ok, %{robot: %Robot{east: 1, facing: :north}}}
    end

    test "It moves west one space", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == :north
    end
  end

  describe "When the robot is facing East" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: :east}}}
    end

    test "It moves one space East", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == 1
    end

    test "it turns left to face North", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :north
    end

    test "It turns right to face South", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :south
    end
  end

  describe "when the robot is facing east, and it has moved north once" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :east}}}
    end

    test "moves east one space", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == :east
    end
  end

  describe "When the robot is facing South" do
    setup do
      {:ok, %{robot: %Robot{north: 0, facing: :south}}}
    end

    test "It moves one space South", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == -1
    end

    test "it turns left to face East", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :east
    end

    test "It turns right to face West", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :west
    end
  end

  describe "when the robot is facing South, and it has moved east once" do
    setup do
      {:ok, %{robot: %Robot{east: 1, facing: :south}}}
    end

    test "It moves west one space", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == -1
      assert robot.east == 1
      assert robot.facing == :south
    end
  end

  describe "When the robot is facing West" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: :west}}}
    end

    test "It moves one space West", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == -1
    end

    test "it turns left to face South", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :south
    end

    test "It turns right to face North", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :north
    end
  end

  describe "when the robot is facing West, and it has moved north once" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :west}}}
    end

    test "It moves west one space", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == -1
      assert robot.facing == :west
    end
  end
end

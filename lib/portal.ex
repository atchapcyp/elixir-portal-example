defmodule Portal do
  @moduledoc """
  Documentation for Portal.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Portal.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Starts transfering `data` from `left` to `right`.
  """
  defstruct [:left, :right]

  def transfer(left, right, data) do
    for item <- data do
      Portal.Door.push(left, item)
    end

    %Portal{left: left, right: right}
  end

  @doc """
  Pushes data to the right in the given `portal`.
  """
  def push_right(portal) do
    case Portal.Door.pop(portal.left) do
      :error -> :ok
      {:ok, h} -> Portal.Door.push(portal.right, h)
    end

    portal
  end
end

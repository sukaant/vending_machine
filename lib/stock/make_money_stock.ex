defmodule VendingMachine.MakeMoneyStock do
  @coin %{
    50 => 50,
    25 => 50,
    10 => 50,
    5 => 50,
    1 => 50
  }

  @note %{
    100 => 50,
    50 => 50,
    20 => 50,
    10 => 50,
    5 => 50,
    2 => 50,
    1 => 50
  }

  def coin, do: @coin
  def note, do: @note
end

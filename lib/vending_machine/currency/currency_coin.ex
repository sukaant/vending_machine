defmodule VendingMachine.CurrencyCoin do
  @enforce_keys [:diameter, :thickness, :mass]
  defstruct [:diameter, :thickness, :mass]

  @currency_coins [50, 25, 10, 5, 1]

  def validate_coin_and_get_value(coin_specification) do
    case coin_specification do
      %__MODULE__{diameter: 0.750, thickness: 1.55, mass: 2.500} -> 0.01
      %__MODULE__{diameter: 0.835, thickness: 1.95, mass: 5.000} -> 0.05
      %__MODULE__{diameter: 0.705, thickness: 1.35, mass: 2.268} -> 0.10
      %__MODULE__{diameter: 0.955, thickness: 1.75, mass: 5.670} -> 0.25
      %__MODULE__{diameter: 1.205, thickness: 2.15, mass: 11.340} -> 0.50
      %__MODULE__{diameter: 1.043, thickness: 2.00, mass: 8.100} -> 1.00
      _ -> 0.00
    end
  end

  def get_coin_list, do: @currency_coins
end

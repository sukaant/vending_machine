defmodule VendingMachine.Currency do
  alias VendingMachine.{CurrencyCoin, CurrencyNote}

  @enforce_keys [:notes, :coins]
  defstruct [:notes, :coins]
  # def add_money() do

  # end

  def get_currency_value(currency) do
    case currency do
      %CurrencyCoin{diameter: _, mass: _, thickness: _} ->
        CurrencyCoin.validate_coin_and_get_value(currency)

      %CurrencyNote{background_color: _, fluorescent_strip_color: _, obverse: _, reverse: _} ->
        CurrencyNote.validate_note_and_get_value(currency)
    end
  end

  def get_currency_notes_and_coins(amount) do
    %{
      notes:
        Float.to_string(amount)
        |> String.split(".")
        |> Enum.at(0)
        |> String.to_integer(),
      coins:
        Float.to_string(amount)
        |> String.split(".")
        |> Enum.at(1)
        |> String.to_integer()
    }
  end

  def get_detail_currency_count(currency, amount, opts \\ []) do
    (currency -- opts)
    |> Enum.reduce(%{amount: amount, map: %{}}, fn currency, amount_map ->
      create_currency_count(currency, amount_map)
    end)
    |> Map.get(:map)
  end

  defp create_currency_count(currency, amount_map) do
    repeat = div(amount_map.amount, currency)
    amount_remaining = rem(amount_map.amount, currency)

    if repeat != 0 do
      amount = currency * repeat
      new_map = Map.put(amount_map.map, amount, %{currency: currency, count: repeat})
      %{amount: amount_remaining, map: new_map}
    else
      %{amount: amount_remaining, map: amount_map.map}
    end
  end

  def sum(currency_list) do
    Enum.sum(currency_list)
    |> Float.round(2)
  end

  def is_valid_amount(str) do
    case Float.parse(str) do
      {_num, ""} -> true
      _ -> false
    end
  end

  def sum(coins_sum, notes_sum) do
    (coins_sum + notes_sum)
    |> Float.round(2)
  end
end

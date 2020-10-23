defmodule VendingMachine.CurrencyData do

  alias VendingMachine.QueryHelper

  def add_currency_note(currency_note) do
    [
      node_name: "CurrencyNote",
      param: ~s({
        backgroundColor: "#{Keyword.fetch!(currency_note, :background_color)}",
        fluorescentStripColor: "#{Keyword.fetch!(currency_note, :fluorescent_strip_color)}",
        obverse: "#{Keyword.fetch!(currency_note, :obverse)}",
        reverse: "#{Keyword.fetch!(currency_note, :reverse)}",
        value: #{Keyword.fetch!(currency_note, :value)}
        }),
      on_create: [quantity: Keyword.fetch!(currency_note, :quantity)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def add_currency_coin(currency_coin) do
    [
      node_name: "CurrencyCoin",
      param: ~s({
        diameter: #{Keyword.fetch!(currency_coin, :diameter)},
        thickness: #{Keyword.fetch!(currency_coin, :thickness)},
        mass: #{Keyword.fetch!(currency_coin, :mass)},
        value: #{Keyword.fetch!(currency_coin, :value)}
        }),
      on_create: [quantity: Keyword.fetch!(currency_coin, :quantity)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def update_currency_note(currency_note) do
    [
      node_name: "CurrencyNote",
      param: ~s({
        backgroundColor: #{Keyword.fetch!(currency_note, :background_color)},
        fluorescentStripColor: #{Keyword.fetch!(currency_note, :fluorescent_strip_color)},
        obverse: #{Keyword.fetch!(currency_note, :obverse)},
        reverse: #{Keyword.fetch!(currency_note, :reverse)},
        value: #{Keyword.fetch!(currency_note, :value)}
        }),
      on_match: [quantity: Keyword.fetch!(currency_note, :quantity)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def update_currency_coin(currency_coin) do
    [
      node_name: "CurrencyCoin",
      param: ~s({
        diameter: #{Keyword.fetch!(currency_coin, :diameter)},
        thickness: #{Keyword.fetch!(currency_coin, :thickness)},
        mass: #{Keyword.fetch!(currency_coin, :mass)},
        value: #{Keyword.fetch!(currency_coin, :value)}
        }),
      on_match: [quantity: Keyword.fetch!(currency_coin, :quantity)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def check_available_currency_note(currency_note) do
    [
      node_name: "CurrencyNote",
      param: ~s({
        backgroundColor: #{Keyword.fetch!(currency_note, :background_color)},
        fluorescentStripColor: #{Keyword.fetch!(currency_note, :fluorescent_strip_color)},
        obverse: #{Keyword.fetch!(currency_note, :obverse)},
        reverse: #{Keyword.fetch!(currency_note, :reverse)},
        value: #{Keyword.fetch!(currency_note, :value)}
        }),
      where: [quantity: Keyword.fetch!(currency_note, :quantity)]
    ]
    |> QueryHelper.match_node_query()
  end

  def check_available_currency_coin(currency_coin) do
    [
      node_name: "CurrencyCoin",
      param: ~s({
        diameter: #{Keyword.fetch!(currency_coin, :diameter)},
        thickness: #{Keyword.fetch!(currency_coin, :thickness)},
        mass: #{Keyword.fetch!(currency_coin, :mass)},
        value: #{Keyword.fetch!(currency_coin, :value)}
        }),
      where: [quantity: Keyword.fetch!(currency_coin, :quantity)]
    ]
    |> QueryHelper.match_node_query()
  end
end

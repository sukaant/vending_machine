defmodule VendingMachine.CurrencyDataTest do
  use ExUnit.Case
  alias VendingMachine.CurrencyData

  test "should return '100.00' if the given specification of background_color does not matches with any Currency Note" do
    given_currency_note = [
      background_color: "Teal",
      fluorescent_strip_color: "Pink",
      obverse: "Benjamin Franklin",
      reverse: "Independence Hall",
      value: 100.00,
      quantity: 100
    ]

  expected_labels = ["CurrencyNote"]
  expected_properties = %{
    "backgroundColor" => "Teal",
    "fluorescentStripColor" => "Pink",
    "obverse" => "Benjamin Franklin",
    "quantity" => 100,
    "reverse" => "Independence Hall",
    "value" => "100.0"
  }

    actual_value =
      CurrencyData.add_currency_note(given_currency_note).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end
end

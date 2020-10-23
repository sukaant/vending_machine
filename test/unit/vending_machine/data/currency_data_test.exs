defmodule VendingMachine.CurrencyDataTest do
  use ExUnit.Case
  alias VendingMachine.CurrencyData

  test "should return Currency Note details when Currency Note is created successfully" do
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
      "value" => 100.0
    }

    actual_value =
      CurrencyData.add_currency_note(given_currency_note).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Currency Note details when Currency Note is updated successfully" do
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
      "value" => 100.0
    }

    actual_value =
      CurrencyData.update_currency_note(given_currency_note).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Currency Note details when given Currency Note exists" do
    given_currency_note = [
      background_color: "Teal",
      fluorescent_strip_color: "Pink",
      obverse: "Benjamin Franklin",
      reverse: "Independence Hall",
      value: 100.00
    ]

    expected_labels = ["CurrencyNote"]
    expected_properties = %{
      "backgroundColor" => "Teal",
      "fluorescentStripColor" => "Pink",
      "obverse" => "Benjamin Franklin",
      "quantity" => 100,
      "reverse" => "Independence Hall",
      "value" => 100.0
    }

    actual_value =
      CurrencyData.check_available_currency_note(given_currency_note).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Currency Coin when Currency Coin is created successfully" do
    given_currency_coin = [
      diameter: 1.043,
      thickness: 2.00,
      mass: 8.100,
      value: 1.00,
      quantity: 100
    ]

    expected_labels = ["CurrencyCoin"]
    expected_properties = %{
      "diameter" => 1.043,
      "thickness" => 2.00,
      "mass" => 8.100,
      "quantity" => 100,
      "value" => 1.0
    }

    actual_value =
      CurrencyData.add_currency_coin(given_currency_coin).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Currency Coin when Currency Coin is updated successfully" do
    given_currency_coin = [
      diameter: 1.043,
      thickness: 2.00,
      mass: 8.100,
      value: 1.00,
      quantity: 100
    ]

    expected_labels = ["CurrencyCoin"]
    expected_properties = %{
      "diameter" => 1.043,
      "thickness" => 2.00,
      "mass" => 8.100,
      "quantity" => 100,
      "value" => 1.0
    }

    actual_value =
      CurrencyData.update_currency_coin(given_currency_coin).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Currency Coin details when given Currency Coin exists" do
    given_currency_coin = [
      diameter: 1.043,
      thickness: 2.00,
      mass: 8.100,
      value: 1.0
    ]

    expected_labels = ["CurrencyCoin"]
    expected_properties = %{
      "diameter" => 1.043,
      "thickness" => 2.00,
      "mass" => 8.100,
      "quantity" => 100,
      "value" => 1.0
    }

    actual_value =
      CurrencyData.check_available_currency_coin(given_currency_coin).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end
end

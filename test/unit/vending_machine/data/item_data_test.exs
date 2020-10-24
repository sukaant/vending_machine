defmodule VendingMachine.ItemDataTest do
  use ExUnit.Case
  alias VendingMachine.ItemData

  test "should return Item details when Item is created successfully" do
    given_item = [
      key: "A1",
      name: "Coke",
      display: "🍹",
      department: "Soft Drink",
      price: 1.32,
      quantity: 100
    ]

    expected_labels = ["Item"]

    expected_properties = %{
      "department" => "Soft Drink",
      "display" => "🍹",
      "key" => "A1",
      "name" => "Coke",
      "price" => 1.32,
      "quantity" => 100
    }

    actual_value =
      ItemData.add_item(given_item).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Item details when Item is updated successfully" do
    given_item = [
      key: "A1",
      name: "Coke",
      display: "🍹",
      department: "Soft Drink",
      price: 1.32,
      quantity: 100
    ]

    expected_labels = ["Item"]

    expected_properties = %{
      "department" => "Soft Drink",
      "display" => "🍹",
      "key" => "A1",
      "name" => "Coke",
      "price" => 1.32,
      "quantity" => 100
    }

    actual_value =
      ItemData.update_item(given_item).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end

  test "should return Item details when given Item exists" do
    given_item = [
      key: "A1",
      name: "Coke",
      display: "🍹",
      department: "Soft Drink"
    ]

    expected_labels = ["Item"]

    expected_properties = %{
      "department" => "Soft Drink",
      "display" => "🍹",
      "key" => "A1",
      "name" => "Coke",
      "price" => 1.32,
      "quantity" => 100
    }

    actual_value =
      ItemData.check_available_item(given_item).results
      |> List.first()
      |> Map.get("n")

    assert expected_labels == actual_value.labels
    assert expected_properties == actual_value.properties
  end
end

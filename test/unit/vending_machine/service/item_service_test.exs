defmodule VendingMachine.ItemServiceTest do
  use ExUnit.Case
  alias VendingMachine.{Item, ItemService, Stock}

  test "should return 'stock detail' with currency and item when requested to load vending machine" do
    actual_value = ItemService.load_vending_machine()
    expected_value = Stock.stock_detail()
    assert expected_value == actual_value
  end

  test "should return 'x' if the entered key is not available in the stock of items" do
    given_item = %{
      A1: %{name: "Coke", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20}
    }

    given_key = "k1"
    expected_value = "x"
    actual_value = ItemService.verify_key(given_item, given_key)
    assert expected_value == actual_value
  end

  test "should return 'true' with currency and item when requested to load vending machine" do
    given_item = %Item{
      key: "A1",
      display: "🍹",
      name: "Coke",
      department: "Soft Drink",
      quantity: 2,
      price: 2.00
    }

    expected_value = true
    actual_value = ItemService.is_item_available(given_item)
    assert expected_value == actual_value
  end

  test "should return 'false' with currency and item when requested to load vending machine" do
    given_item = %Item{
      key: "A1",
      display: "🍹",
      name: "Coke",
      department: "Soft Drink",
      quantity: 0,
      price: 2.00
    }

    expected_value = false
    actual_value = ItemService.is_item_available(given_item)
    assert expected_value == actual_value
  end

  test "should return 'selected product' with currency and item when requested to load vending machine" do
    given_item = %{
      A1: %{name: "Coke", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20}
    }

    given_key = :A1
    given_quantity = 2

    expected_value = %Item{
      key: :A1,
      display: "🍹",
      name: "Coke",
      department: "Soft Drink",
      quantity: 2,
      price: 2.0
    }

    actual_value = ItemService.get_selected_item_detail(given_item, given_key, given_quantity)
    assert expected_value == actual_value
  end

  test "should return 'updated stock' with currency and item when requested to load vending machine" do
    given_item = %Item{
      key: :A1,
      display: "🍹",
      name: "Coke",
      department: "Soft Drink",
      quantity: 2,
      price: 2.00
    }

    given_stock = %{
      money: %{},
      item: %{
        A1: %{name: "Coke", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20}
      }
    }

    expected_value = %{
      money: %{},
      item: %{
        A1: %{name: "Coke", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 18}
      }
    }

    actual_value = ItemService.update_stock_for_sold_item(given_item, given_stock)
    assert expected_value == actual_value
  end

  test "should return '[💲,💲,💲,💲,💲]' with currency and item when requested to load vending machine" do
    given_no_of_times = 5
    given_item_display = "💲"
    expected_value = ["💲", "💲", "💲", "💲", "💲"]
    actual_value = ItemService.create_sell_item(given_no_of_times, given_item_display)
    assert expected_value == actual_value
  end
end

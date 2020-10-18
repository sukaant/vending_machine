defmodule VendingMachine.ItemTest do
  use ExUnit.Case
  alias VendingMachine.Item

  test "should return '2' if the ordered quantity is less than the available quantity in the stock" do
    given_item = %{name: "cola", price: 1.00, quantity: 20}
    given_order_quantity = 2
    expected_value = 2
    actual_value = Item.check_quantity(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return '20' if the ordered quantity is equal to the available quantity in the stock" do
    given_item = %{name: "cola", price: 1.00, quantity: 20}
    given_order_quantity = 20
    expected_value = 20
    actual_value = Item.check_quantity(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return '20' if the ordered quantity is more than the available quantity in the stock" do
    given_item = %{name: "cola", price: 1.00, quantity: 20}
    given_order_quantity = 42
    expected_value = 20
    actual_value = Item.check_quantity(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return '0' if the stock is not available" do
    given_item = %{name: "cola", price: 1.00, quantity: 0}
    given_order_quantity = 2
    expected_value = 0
    actual_value = Item.check_quantity(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return '2' by calculating the ordered quantity to the price of item" do
    given_item = %{name: "cola", price: 1.00, quantity: 20}
    given_order_quantity = 2
    expected_value = 2.00
    actual_value = Item.payment_amount(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return '0' when the stock is not available" do
    given_item = %{name: "cola", price: 1.00, quantity: 0}
    given_order_quantity = 0
    expected_value = 0.00
    actual_value = Item.payment_amount(given_item, given_order_quantity)
    assert expected_value == actual_value
  end

  test "should return 'item' by updating the quantity of key :A1 to 18 when the stock is not available" do
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

    actual_value = Item.update_item_quantity(given_item, given_stock)
    assert expected_value == actual_value
  end

  # test "should return 'item' by updating the quantity of key :A1 to 0 when the stock is not available" do
  #   given_item = %{
  #     A1: %{name: "cola", price: 1.00, quantity: 20},
  #     B2: %{name: "chips", price: 0.50, quantity: 20},
  #     C3: %{name: "candy", price: 0.65, quantity: 20}
  #   }

  #   given_key = :A1
  #   given_sold_quantity = 22

  #   expected_value = %{
  #     A1: %{name: "cola", price: 1.0, quantity: 0},
  #     B2: %{name: "chips", price: 0.5, quantity: 20},
  #     C3: %{name: "candy", price: 0.65, quantity: 20}
  #   }

  #   actual_value = Item.update_item_quantity(given_item, given_key, given_sold_quantity)
  #   assert expected_value == actual_value
  # end
end

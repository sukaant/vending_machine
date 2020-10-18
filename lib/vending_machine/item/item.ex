defmodule VendingMachine.Item do
  @enforce_keys [:key, :display, :name, :department, :quantity, :price]
  defstruct [:key, :display, :name, :department, :quantity, :price]

  def select_product(item, key, quantity) do
    available_quantity = check_quantity(item[key], quantity)
    payment_amount = payment_amount(item[key], available_quantity)
    item[:key]

    %__MODULE__{
      key: key,
      display: item[key][:display],
      name: item[key][:name],
      department: item[key][:department],
      quantity: available_quantity,
      price: payment_amount
    }
  end

  def check_quantity(item_map, order_quantity) do
    item_map[:quantity]
    |> min(order_quantity)
  end

  def payment_amount(item_map, quantity) do
    (item_map[:price] * quantity)
    |> Float.round(2)
  end

  def update_item_quantity(item, stock) do
    actual_quantity = stock[:item][item.key][:quantity]

    if actual_quantity > 0 and actual_quantity >= item.quantity do
      updated_quantity =
        stock[:item][item.key]
        |> Map.put(:quantity, actual_quantity - item.quantity)

      updated_item = Map.put(stock[:item], item.key, updated_quantity)
      Map.put(stock, :item, updated_item)
    else
      stock
    end
  end

  # def add_item(item, key, sold_quantity) do
  #   actual_quantity =
  #     Map.get(item, key)
  #     |> Map.get(:quantity)

  #   if actual_quantity > 0 and actual_quantity >= sold_quantity do
  #     updated_quantity =
  #       item[key]
  #       |> Map.put(:quantity, actual_quantity - sold_quantity)

  #     Map.put(item, key, updated_quantity)
  #   else
  #     item
  #   end
  # end
end

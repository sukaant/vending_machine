defmodule VendingMachine.ItemService do
  alias VendingMachine.{Item, Stock}
  def load_vending_machine, do: Stock.create_stock()

  def load_vending_machine_money, do: Stock.create_money()

  def load_vending_machine_item, do: Stock.create_item()

  def verify_key(item, key) do
    if not Map.has_key?(item, key) do
      "x"
    end
  end

  def is_item_available(item) do
    if item.quantity > 0 do
      true
    else
      false
    end
  end

  def get_selected_item_detail(item, key, quantity) do
    Item.select_product(item, key, quantity)
  end

  def update_stock_for_sold_item(item, stock) do
    Item.update_item_quantity(item, stock)
  end

  def create_sell_item(n, x), do: for(_ <- 1..n, do: x)
end

defmodule VendingMachine.ItemData do

  alias VendingMachine.QueryHelper

  def add_item(item) do
    [
      node_name: "Item",
      param: ~s({
        key: #{Keyword.fetch!(item, :key)},
        display: #{Keyword.fetch!(item, :display)},
        name: #{Keyword.fetch!(item, :name)},
        department: #{Keyword.fetch!(item, :department)}
        }),
      on_create: [quantity: Keyword.fetch!(item, :quantity), price: Keyword.fetch!(item, :price)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def update_item(item) do
    [
      node_name: "Item",
      param: ~s({
        key: #{Keyword.fetch!(item, :key)},
        display: #{Keyword.fetch!(item, :display)},
        name: #{Keyword.fetch!(item, :name)},
        department: #{Keyword.fetch!(item, :department)}
        }),
      on_match: [quantity: Keyword.fetch!(item, :quantity), price: Keyword.fetch!(item, :price)]
    ]
    |> QueryHelper.merge_node_query()
  end

  def check_available_item(item) do
    [
      node_name: "Item",
      param: ~s({
        key: #{Keyword.fetch!(item, :key)},
        display: #{Keyword.fetch!(item, :display)},
        name: #{Keyword.fetch!(item, :name)},
        department: #{Keyword.fetch!(item, :department)}
        }),
      where: [quantity: Keyword.fetch!(item, :quantity), price: Keyword.fetch!(item, :price)]
    ]
    |> QueryHelper.match_node_query()
  end
end

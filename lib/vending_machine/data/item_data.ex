defmodule VendingMachine.ItemData do

  alias VendingMachine.QueryHelper

  def add_item(item) do
    [
      node_name: "Item",
      param: ~s({
        key: #{Keyword.fetch!(item, :key)},
        display: #{Keyword.fetch!(item, :display)},
        name: #{Keyword.fetch!(item, :name)},
        department: #{Keyword.fetch!(item, :department)},
        quantity: #{Keyword.fetch!(item, :quantity)},
        price: #{Keyword.fetch!(item, :price)}
        })
    ]
    |> QueryHelper.merge_node_query()
  end
end
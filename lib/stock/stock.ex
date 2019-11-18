defmodule VendingMachine.Stock do
  alias VendingMachine.{MakeItemStock, MakeMoneyStock}

  def create_stock do
    %{
      money: %{note: MakeMoneyStock.note(), coin: MakeMoneyStock.coin()},
      item: MakeItemStock.item()
    }
  end
end

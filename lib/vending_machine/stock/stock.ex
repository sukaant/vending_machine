defmodule VendingMachine.Stock do
  alias VendingMachine.{MakeItemStock, MakeMoneyStock}

  def create_stock do
    %{
      money: %{note: MakeMoneyStock.note(), coin: MakeMoneyStock.coin()},
      item: MakeItemStock.item()
    }
  end

  def create_money do
    %{
      money: %{note: MakeMoneyStock.note(), coin: MakeMoneyStock.coin()}
    }
  end

  def create_item do
    %{
      item: MakeItemStock.item()
    }
  end
end

defmodule VendingMachine.Load do
  alias VendingMachine.{ItemOperation}

  def start_vending_machine do
    ItemOperation.operate()
  end
end

# alias VendingMachine.{CurrencyCoin, CurrencyNote, Currency, Display, ItemOperation, Item, MakeCurrency, MakeItemStock, MakeMoneyStock, Order, PaymentOperation}

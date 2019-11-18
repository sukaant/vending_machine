defmodule VendingMachine.CurrencyTest do
  alias VendingMachine.Currency

  Currency.get_currency_value(currency)
  Currency.get_currency_notes_and_coins(amount)

  Currency.get_detail_currency_count(currency, amount, filter_unavailable_currency)

  Currency.sum(currency_list)

  Currency.sum(coins_sum, notes_sum)
end

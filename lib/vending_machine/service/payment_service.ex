defmodule VendingMachine.PaymentService do
  alias VendingMachine.{
    Currency,
    CurrencyCoin,
    CurrencyNote,
    MakeCurrency
  }

  def is_valid_currency(amount) do
    if MakeCurrency.make_currency(amount) != 0.00 do
      true
    else
      false
    end
  end

  def arrange_refund_amount(balance_amount) do
    currency_detail = Currency.get_currency_notes_and_coins(balance_amount)

    currency_notes = Currency.get_detail_currency_count(CurrencyNote.get_note_list(), currency_detail[:notes])

    currency_coins = Currency.get_detail_currency_count(CurrencyCoin.get_coin_list(), currency_detail[:coins])

    %Currency{notes: currency_notes, coins: currency_coins}
  end

  def calculate_balance_status(amount_added, amount_required) do
    cond do
      amount_added < amount_required -> "add_cash"
      amount_added > amount_required -> "return_cash"
      amount_added == amount_required -> "deliver_item"
    end
  end

  def calculate_difference_amount(first_amount, second_amount) do
    Float.round(first_amount - second_amount, 2)
  end

  def calculate_sum_amount(first_amount, second_amount) do
    Float.round(first_amount + second_amount, 2)
  end
end

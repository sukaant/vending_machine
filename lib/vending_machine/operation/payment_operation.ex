defmodule VendingMachine.PaymentOperation do
  alias VendingMachine.{
    ItemOperation,
    PaymentDisplay,
    PaymentService
  }

  def operate(item, stock) do
    display_amount_and_accept_money(item.price, Float.round(0.00, 2), item, stock)
  end

  defp display_amount_and_accept_money(amount_required, amount_added, item, stock) do
    PaymentDisplay.display_amount(amount_required, amount_added, item.price)
    |> validate_currency(item.price, amount_added, item, stock)
  end

  def validate_currency(money_added, amount_required, amount_added, item, stock) do
    if PaymentService.is_valid_currency(money_added) do
      calculate_valid_currency(money_added, amount_required, amount_added, item, stock)
    else
      show_invalid_currency(amount_required, amount_added, item, stock)
    end
  end

  def calculate_valid_currency(money_added, amount_required, amount_added, item, stock) do
    balance_status = PaymentService.calculate_balance_status(money_added, amount_required)

    case balance_status do
      "add_cash" -> show_required_amount(money_added, amount_required, amount_added, item, stock)
      "return_cash" -> return_cash(money_added, amount_required, item, stock)
      "deliver_item" -> ItemOperation.deliver_item(item, stock)
    end
  end

  def return_cash(amount_added, amount_required, item, stock) do
    PaymentService.calculate_difference_amount(amount_added, amount_required)
    |> arrange_refund_amount(item, stock)
  end

  defp show_invalid_currency(amount_required, amount_added, item, stock) do
    PaymentDisplay.display_invalid_currency()

    PaymentDisplay.display_amount(amount_required, amount_added, item.price)
    |> validate_currency(amount_required, amount_added, item, stock)
  end

  defp show_required_amount(money_added, amount_required, amount_added, item, stock) do
    new_required_amount = PaymentService.calculate_difference_amount(amount_required, money_added)
    new_added_money = PaymentService.calculate_sum_amount(amount_added, money_added)

    display_amount_and_accept_money(new_required_amount, new_added_money, item, stock)
  end

  defp arrange_refund_amount(balance_amount, item, stock) do
    PaymentService.arrange_refund_amount(balance_amount)
    |> return_money(balance_amount, item, stock)
  end

  defp return_money(return_amount, balance_amount, item, stock) do
    PaymentDisplay.display_collect_balance(to_string(balance_amount))
    display_notes_detail(return_amount.notes)
    display_coins_detail(return_amount.coins)
    ItemOperation.deliver_item(item, stock)
  end

  defp display_notes_detail(currency_notes) do
    Enum.each(currency_notes, fn {k, v} ->
      PaymentDisplay.return_money_display(v[:currency], k, v[:count])
    end)
  end

  defp display_coins_detail(currency_coins) do
    Enum.each(currency_coins, fn {k, v} ->
      PaymentDisplay.return_money_display(v[:currency] / 100, k / 100, v[:count])
    end)
  end
end

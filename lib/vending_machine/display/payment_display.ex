defmodule VendingMachine.PaymentDisplay do
  alias VendingMachine.{Display}
  alias IEx.Helpers

  def display_amount(amount_required, amount_added, price) do
    Helpers.clear()
    Display.print_border_line()
    Display.print_insert_money()
    Display.print_center_line()
    Display.print_item_price("#{price}")
    Display.print_amount_required("#{amount_required}")
    Display.print_money_added("#{amount_added}")
    Display.print_border_line()

    Display.print_add_money()
    |> String.trim()
    |> String.to_float()
    |> Float.round(2)
  end

  def print_receipt(department, name, quantity, price) do
    Helpers.clear()
    Display.print_border_line()
    Display.print_purchase_detail()
    Display.print_center_line()
    Display.print_current_date()
    Display.print_current_time()
    Display.print_department(department)
    Display.print_item_name(name)
    Display.print_item_quantity(to_string(quantity))
    Display.print_payment_amount(to_string(price))
    Display.print_border_line()
    Process.sleep(5000)
  end

  def return_money_display(currency_value, amount, count) do
    Display.print_currency_value(to_string(currency_value))
    Display.print_amount(to_string(amount))
    Display.print_count(to_string(count))
  end

  def display_invalid_currency do
    Helpers.clear()
    Display.print_invalid_currency()
    Process.sleep(2000)
  end

  def display_collect_balance(balance_amount) do
    Helpers.clear()
    Display.print_border_line()
    Display.print_collect_balance(balance_amount)
  end
end

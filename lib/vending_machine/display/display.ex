defmodule VendingMachine.Display do
  alias VendingMachine.DisplayValues

  def print_border_line, do: IO.inspect(DisplayValues.border_line())

  def print_center_line, do: IO.inspect(DisplayValues.center_line())

  def print_available_products, do: IO.inspect(DisplayValues.available_products())

  def print_select_product, do: IO.gets(DisplayValues.select_product())

  def print_enter_quantity, do: IO.gets(DisplayValues.enter_quantity())

  def print_item_available, do: IO.inspect(DisplayValues.item_available())

  def print_item_code(code), do: IO.inspect(DisplayValues.item_code() <> code)

  def print_display(display), do: IO.inspect(DisplayValues.display() <> display)

  def print_item_name(item_name), do: IO.inspect(DisplayValues.item_name() <> item_name)

  def print_department(department), do: IO.inspect(DisplayValues.department() <> department)

  def print_item_quantity(item_quantity),
    do: IO.inspect(DisplayValues.item_quantity() <> item_quantity)

  def print_item_price(item_price), do: IO.inspect(DisplayValues.item_price() <> item_price)

  def print_item_sold_out, do: IO.inspect(DisplayValues.item_sold_out())

  def print_confirm_continue, do: IO.gets(DisplayValues.confirm_continue())

  def print_insert_money, do: IO.inspect(DisplayValues.insert_money())

  def print_amount_required(amount_required),
    do: IO.inspect(DisplayValues.amount_required() <> amount_required)

  def print_money_added(money_added), do: IO.inspect(DisplayValues.money_added() <> money_added)

  def print_add_money, do: IO.gets(DisplayValues.add_money())

  def print_invalid_currency, do: IO.inspect(DisplayValues.invalid_currency())

  def print_collect_item, do: IO.inspect(DisplayValues.collect_item())

  def print_ask_for_receipt, do: IO.gets(DisplayValues.ask_for_receipt())

  def print_purchase_detail, do: IO.inspect(DisplayValues.purchase_detail())

  def print_current_date,
    do: IO.inspect(DisplayValues.current_date() <> to_string(Date.utc_today()))

  def print_current_time,
    do: IO.inspect(DisplayValues.current_time() <> to_string(Time.truncate(Time.utc_now(), :second)))

  def print_payment_amount(payment_amount),
    do: IO.inspect(DisplayValues.payment_amount() <> payment_amount)

  def print_collect_balance(collect_balance),
    do: IO.inspect(DisplayValues.collect_balance() <> collect_balance)

  def print_thank_you, do: IO.inspect(DisplayValues.thank_you())

  def print_invalid_entry, do: IO.inspect(DisplayValues.invalid_entry())

  def print_amount(amount), do: IO.inspect(DisplayValues.amount() <> amount)

  def print_currency_value(currency_value),
    do: IO.inspect(DisplayValues.currency_value() <> currency_value)

  def print_count(count), do: IO.inspect(DisplayValues.count() <> count)

  def print_default(default_value), do: IO.inspect(default_value)
end

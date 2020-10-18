defmodule VendingMachine.DisplayValues do
  @border_line "========================================"
  @center_line "----------------------------------------"
  @available_products "-:AVAILABLE PRODUCTS ARE:-"
  @select_product "PRESS THE ITEM CODE TO SELECT THE PRODUCT (Eg: ':A1'): "
  @enter_quantity "ENTER THE QUANTITY: "
  @item_available "-: SELECTED ITEM AVAILABLE :-"
  @item_code "ITEM CODE: "
  @display "DISPLAY: "
  @item_name "NAME: "
  @department "DEPARTMENT: "
  @item_quantity "Quantity: "
  @item_price "Price: 💲 "
  @item_sold_out "SORRY SELECTED ITEM SOLD OUT!"
  @confirm_continue "DO YOU WANT TO CONTINUE? (PRESS (Y/N)): "
  @invalid_entry "INVALID ENTRY, PLEASE TRY AGAIN!"
  @insert_money "-: INSERT MONEY :-"
  @amount_required "AMOUNT REQUIRED: 💲 "
  @money_added "MONEY ADDED: 💲 "
  @add_money "ADD MONEY: 💲 "
  @invalid_currency "INVALID CURRENCY, PLEASE COLLECT IT FROM MONEY RETURN AND INSERT OTHER CURRENCY!"
  @collect_item "-:PLEASE COLLECT YOUR ORDERED ITEM:-"
  @ask_for_receipt "DO YOU WANT TO PRINT THE RECEIPT ? (PRESS (Y/N)): "
  @purchase_detail "-: ITEM PURCHASE DETAIL :-"
  @current_date "DATE: "
  @current_time "TIME: "
  @payment_amount "PAYMENT AMOUNT: 💲 "
  @confirm_continue "DO YOU WANT TO CONTINUE? (PRESS (Y/N)): "
  @collect_balance "PLEASE COLLECT THE BALANCE AMOUNT 💰: 💲 "
  @thank_you "🙏 THANK YOU !! 🙏"
  @amount "AMOUNT: $"
  @currency_value "CURRENCY VALUE: 💲 "
  @count "COUNT 💵: "

  def border_line, do: @border_line

  def center_line, do: @center_line

  def available_products, do: @available_products

  def select_product, do: @select_product

  def enter_quantity, do: @enter_quantity

  def item_available, do: @item_available

  def item_code, do: @item_code

  def display, do: @display

  def item_name, do: @item_name

  def department, do: @department

  def item_quantity, do: @item_quantity

  def item_price, do: @item_price

  def item_sold_out, do: @item_sold_out

  def confirm_continue, do: @confirm_continue

  def insert_money, do: @insert_money

  def amount_required, do: @amount_required

  def money_added, do: @money_added

  def add_money, do: @add_money

  def invalid_currency, do: @invalid_currency

  def collect_item, do: @collect_item

  def ask_for_receipt, do: @ask_for_receipt

  def purchase_detail, do: @purchase_detail

  def current_date, do: @current_date

  def current_time, do: @current_time

  def payment_amount, do: @payment_amount

  def collect_balance, do: @collect_balance

  def thank_you, do: @thank_you

  def invalid_entry, do: @invalid_entry

  def amount, do: @amount

  def currency_value, do: @currency_value

  def count, do: @count

  def display_border_line, do: IO.inspect(border_line())

  def display_center_line, do: IO.inspect(center_line())
end

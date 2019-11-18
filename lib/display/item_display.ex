defmodule VendingMachine.ItemDisplay do
  alias VendingMachine.{Display}
  alias IEx.Helpers

  def display_item_available_header do
    Helpers.clear()
    Display.print_border_line()
    Display.print_available_products()
    Display.print_border_line()
  end

  def display_item(key, item) do
    Display.print_center_line()
    Display.print_item_code(to_string(key))
    Display.print_display(item[:display])
    Display.print_item_name(to_string(item[:name]))
    Display.print_department(to_string(item[:department]))
    Display.print_item_price(to_string(item[:price]))
    Display.print_center_line()
  end

  def item_available(item) do
    Helpers.clear()
    Display.print_border_line()
    Display.print_item_available()
    Display.print_center_line()
    Display.print_item_code("#{item.key}")
    Display.print_display("#{item.display}")
    Display.print_item_name("#{item.name}")
    Display.print_department("#{item.department}")
    Display.print_item_quantity("#{item.quantity}")
    Display.print_item_price("#{item.price}")
    Display.print_border_line()
  end

  def item_unavailable() do
    Helpers.clear()
    Display.print_border_line()
    Display.print_item_sold_out()
    Display.print_border_line()
    Process.sleep(2000)
  end

  def get_item_key do
    Display.print_border_line()

    Display.print_select_product()
    |> String.upcase()
    |> String.trim()
    |> String.to_atom()
  end

  def confirm_continue_shopping do
    Display.print_confirm_continue()
    |> String.trim()
    |> String.downcase()
  end

  def get_item_quantity do
    Display.print_enter_quantity()
    |> String.trim()
    |> String.to_integer()
  end

  def confirm_print_receipt do
    Process.sleep(2000)
    Helpers.clear()

    Display.print_ask_for_receipt()
    |> String.trim()
    |> String.downcase()
  end

  def display_thank_you do
    Helpers.clear()
    Display.print_thank_you()
    Process.sleep(2000)
  end

  def display_invalid_entry do
    Helpers.clear()
    Display.print_invalid_entry()
    Process.sleep(2000)
  end

  def display_collect_item(display_items) do
    Display.print_border_line()
    Process.sleep(5000)
    Helpers.clear()
    Display.print_border_line()
    Display.print_collect_item()
    Display.print_center_line()
    Display.print_default(display_items)
    Display.print_border_line()
    Process.sleep(5000)
  end
end

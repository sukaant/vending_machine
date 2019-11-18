defmodule VendingMachine.ItemController do
  alias VendingMachine.{
    ItemDisplay,
    ItemService,
    PaymentDisplay,
    PaymentOperation
  }

  def operate() do
    ItemService.load_vending_machine()
    # |> load_vending_machine
  end

  def load_vending_machine(stock) do
    # {:hello, stock}
    ItemDisplay.display_item_available_header()
    display_item(stock)
  end

  defp display_item(stock) do
    Enum.each(stock[:item], fn {k, v} -> ItemDisplay.display_item(k, v) end)
    get_key_from_user(stock)
  end

  defp get_key_from_user(stock) do
    ItemDisplay.get_item_key()
    |> verify_key(stock)
  end

  defp verify_key(key, stock) do
    verified_key = ItemService.verify_key(stock[:item], key)

    if verified_key == "x" do
      resume_shopping("x", stock)
    else
      get_quantity_from_user(key, stock)
    end
  end

  defp get_quantity_from_user(key, stock) do
    ItemDisplay.get_item_quantity()
    |> verify_item_availability(key, stock)
  end

  defp verify_item_availability(quantity, key, stock) do
    item = ItemService.get_selected_item_detail(stock[:item], key, quantity)

    ItemService.is_item_available(item)
    |> confirm_item_availability(item, stock)
  end

  defp confirm_item_availability(status, item, stock) do
    if status do
      item_available(item, stock)
    else
      item_unavailable(stock)
    end
  end

  defp item_available(item, stock) do
    ItemDisplay.item_available(item)
    confirm_for_continue_shopping(item, stock)
  end

  defp item_unavailable(stock) do
    ItemDisplay.item_unavailable()
    confirm_for_resuming_shopping(stock)
  end

  def deliver_item(item, stock) do
    ItemService.create_sell_item(item.quantity, item.display)
    |> ItemDisplay.display_collect_item()

    updated_stock = ItemService.update_stock_for_sold_item(item, stock)
    confirm_for_printing_receipt(item, updated_stock)
  end

  defp confirm_for_printing_receipt(item, stock) do
    ItemDisplay.confirm_print_receipt()
    |> check_print_receipt_status(item, stock)
  end

  defp check_print_receipt_status(print_receipt_status, item, stock) do
    cond do
      String.equivalent?(print_receipt_status, "y") ->
        PaymentDisplay.print_receipt(item.department, item.name, item.quantity, item.price)

      String.equivalent?(print_receipt_status, "n") ->
        ItemDisplay.display_thank_you()

      true ->
        ItemDisplay.display_invalid_entry()
        confirm_for_printing_receipt(item, stock)
    end

    confirm_for_resuming_shopping(stock)
  end

  defp confirm_for_resuming_shopping(stock) do
    ItemDisplay.confirm_continue_shopping()
    |> resume_shopping(stock)
  end

  def confirm_for_continue_shopping(item, stock) do
    ItemDisplay.confirm_continue_shopping()
    |> continue_shopping(item, stock)
  end

  defp continue_shopping(continue, item, stock) do
    cond do
      String.equivalent?(continue, "y") ->
        PaymentOperation.operate(item, stock)

      String.equivalent?(continue, "n") ->
        ItemDisplay.display_thank_you()
        load_vending_machine(stock)

      true ->
        ItemDisplay.display_invalid_entry()
        confirm_for_continue_shopping(item, stock)
    end

    load_vending_machine(stock)
  end

  defp resume_shopping(continue, stock) do
    cond do
      String.equivalent?(continue, "y") ->
        load_vending_machine(stock)

      String.equivalent?(continue, "n") ->
        ItemDisplay.display_thank_you()

      true ->
        ItemDisplay.display_invalid_entry()
        load_vending_machine(stock)
    end
  end
end

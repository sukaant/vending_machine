defmodule VendingMachine.VendingClient do

  def get_display(server) do
    GenServer.cast(server, :display_item)
  end

  def get_item_key_from_user(server) do
    GenServer.cast(server, :accept_item_key)
  end
end

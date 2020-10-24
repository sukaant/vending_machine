defmodule VendingMachine.Client do
  @spec get_display(atom | pid | {atom, any} | {:via, atom, any}) :: :ok
  def get_display(server) do
    IO.inspect(server, label: "Gets to VendingMachine.Clien.get_display!!!!!!!!!!!!!!!!!!!")
    GenServer.cast(server, :display)
  end

  def get_display_item(server) do
    IO.inspect(server, label: "Gets to VendingMachine.Clien.get_display!!!!!!!!!!!!!!!!!!!")
    GenServer.cast(server, :display_item)
  end

  def get_display_money(server) do
    IO.inspect(server, label: "Gets to VendingMachine.Clien.get_display!!!!!!!!!!!!!!!!!!!")
    GenServer.cast(server, :display_money)
  end
end

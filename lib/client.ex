defmodule VendingMachine.Client do

  def get_display(server) do
    GenServer.cast(server, :display)
  end
end

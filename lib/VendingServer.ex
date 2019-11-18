defmodule VendingMachine.VendingServer do
  use GenServer
  alias VendingMachine.{Server, ItemController, PaymentController, Stock}

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(_state) do
    initial_state = Stock.create_stock()
    {:ok, initial_state}
  end

  @impl true
  def handle_cast(:load, state) do
    {:noreply, ItemController.load_vending_machine(state)}
  end

end

defmodule VendingMachine.Server do
  use GenServer
  alias VendingMachine.{Server, ItemOperation, Stock}
  @doc """
  Starts the Vending Machine GenServer
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(_state) do
    initial_state = ItemOperation.operate()
    {:ok, initial_state}
  end

  @impl true
  def handle_cast(:display, state) do
    {:noreply, ItemOperation.load_vending_machine(state)}
  end

  # @impl true
  # def handle_call(:display, _from, state) do
  #   {display, new_state} = ItemOperation.load_vending_machine(state)
  #   {:reply, {display, new_state}, new_state}
  # end

  # def get_display(server) do
  #   GenServer.cast(server, :display)
  # end
end

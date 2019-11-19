defmodule VendingMachine.VendingServer do
  use GenServer
  alias VendingMachine.{VendingServer, ItemController, PaymentController, Stash}

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(_state) do
    Process.flag(:trap_exit, true)
    initial_vending_machine_state = Stash.get()
    {:ok, initial_vending_machine_state}
  end

  # @impl true
  # def handle_cast(:display_item, vending_machine_state) do
  #   {:noreply, ItemController.display_item(vending_machine_state)}
  # end

  def handle_call({:verify_key, item_key}, _from, state) do
    {is_item_key_available, new_state} = ItemController.verify_key(item_key, state)
    {:reply, is_item_key_available, new_state}
  end

  def handle_call({:verify_quantity, item_quantity}, _from, state) do

    {is_item_available, new_state} = ItemController.verify_item_availability(item_quantity, item_key, state )
    {:reply, is_item_available, new_state}
  end

  def handle_call(:accept_item_key, _from, vending_machine_state) do
    IO.inspect("Gets to VendingMachine.Server.handle_cast_item!!!!!!!!!!!!!!!!!!!")
    {display, vending_machine_state} = ItemController.get_key_from_user
    {:reply, display, new_vm}
  end

  @impl true
  def handle_cast(:display, state) do
    {:noreply, ItemController.load_vending_machine(state)}
  end



  @impl true
  def handle_info(_msg, state) do
    {:stop, :normal, state}
  end

  @impl true
  def terminate(_reason, state) do
    Stash.update(state)
  end

end

defmodule VendingMachine.Stash do
  use GenServer

  def start_link(initial_vending_machine) do
    GenServer.start_link(__MODULE__, initial_vending_machine, name: __MODULE__)
  end

  def get() do
    GenServer.call(__MODULE__, {:get})
  end

  def update(new_vending_machine) do
    GenServer.cast(__MODULE__, {:update, new_vending_machine})
  end

  def init(initial_vending_machine) do
    {:ok, initial_vending_machine}
  end

  def handle_call({:get}, _from, current_vending_machine) do
    {:reply, current_vending_machine, current_vending_machine}
  end

  def handle_cast({:update, new_vending_machine}, _current_vending_machine) do
    {:noreply, new_vending_machine}
  end
end

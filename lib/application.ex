defmodule VendingMachine.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do

    children = [
      {VendingMachine.Stash, VendingMachine.ItemService.load_vending_machine()},
      {VendingMachine.Server, []}
    ]

    sup_opts = [strategy: :rest_for_one, name: VendingMachine.Supervisor]
    Supervisor.start_link(children, sup_opts)
  end
end

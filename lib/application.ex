defmodule VendingMachine.Application do
  @moduledoc false
  use Application

  alias VendingMachine.{ItemService, Stash, VendingServer}

  def start(_type, _args) do

    children = [
      {Stash, ItemService.load_vending_machine()},
      {VendingServer, []}
    ]

    sup_opts = [strategy: :rest_for_one, name: VendingMachine.Supervisor]
    Supervisor.start_link(children, sup_opts)
  end

  # def start(_type, _args) do
  #   opts = []
  #   # {ServerModule, start_link_arg}
  #   children = [
  #     {Server, opts}
  #   ]

  #   opts = [strategy: :one_for_one, name: VendingMachine.Supervisor]
  #   Supervisor.start_link(children, opts)
  # end
end

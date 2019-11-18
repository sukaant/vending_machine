defmodule VendingMachine.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do

    children = [
      {VendingMachine.Stash, VendingMachine.ItemOperation.operate()},
      {VendingMachine.Server, []}
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

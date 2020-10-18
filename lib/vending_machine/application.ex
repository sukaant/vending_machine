defmodule VendingMachine.Application do
  @moduledoc false
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    [
      {VendingMachine.Stash, VendingMachine.ItemService.load_vending_machine()},
      {VendingMachine.Server, []}
    ]
    |> List.flatten()
    |> Supervisor.start_link(strategy: :one_for_one, name: VendingMachine.Supervisor)

    config_init_neo4j_server()
  end

  def config_init_neo4j_server() do
    Application.get_env(:bolt_sips, Bolt)
    |> Bolt.Sips.start_link()
  end
end

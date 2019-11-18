defmodule VendingMachine.Application do
  use Application

  def start(_type, _args) do
    opts = []
    module = Server
    arg = opts

    # child_spec values
    #
    # Note: "start" is an mfargs() tuple
    #   mfargs() = {module(), atom(), [term()]}
    #
    # Think Kernel.apply/3
    # https://hexdocs.pm/elixir/Kernel.html#apply/3
    #
    id = module
    start = {module, :start_link, [arg]}
    restart = :permanent
    shutdown = 5000
    type = :worker
    modules = [module]

    # 1. Old style child specification
    child_spec = {id, start, restart, shutdown, type, modules}

    # 2. Full map style child specification
    # child_spec = %{
    #   id: id,
    #   start: start,
    #   restart: restart,
    #   shutdown: shutdown,
    #   type: type,
    #   modules: modules
    # }

    # 3. Minimal map style child specification
    # child_spec = %{
    #   id: id,
    #   start: start
    # }

    # 4. Newer {module, arg} tuple child specification
    # Note:
    # A. Relies on
    #   module.child_spec(arg)
    # to generate the actual child specification
    #
    # B. Starting function (defaults to "start_link/1") has to
    # accept exactly one single argument
    # - an empty list for no parameters OR
    # - parameters are passed as elements of the list that is
    #   that one single argument
    #
    # child_spec = {module, arg}

    # 5. Newer module-only child specification
    # Note:
    # This is treated as {module, []},
    # i.e. relies on
    #   module.child_spec([])
    # to generate the actual child specification
    #
    # child_spec = module

    children = [
      child_spec
    ]

    sup_opts = [strategy: :one_for_one, name: VendingMachine.Load]
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

{application,vending_machine,
             [{applications,[kernel,stdlib,elixir,logger,matrix]},
              {description,"vending_machine"},
              {modules,['Elixir.VendingMachine.Application',
                        'Elixir.VendingMachine.Client',
                        'Elixir.VendingMachine.Currency',
                        'Elixir.VendingMachine.CurrencyCoin',
                        'Elixir.VendingMachine.CurrencyNote',
                        'Elixir.VendingMachine.Display',
                        'Elixir.VendingMachine.DisplayValues',
                        'Elixir.VendingMachine.Item',
                        'Elixir.VendingMachine.ItemDisplay',
                        'Elixir.VendingMachine.ItemOperation',
                        'Elixir.VendingMachine.ItemService',
                        'Elixir.VendingMachine.Load',
                        'Elixir.VendingMachine.MakeCurrency',
                        'Elixir.VendingMachine.MakeItemStock',
                        'Elixir.VendingMachine.MakeMoneyStock',
                        'Elixir.VendingMachine.PaymentCard',
                        'Elixir.VendingMachine.PaymentDisplay',
                        'Elixir.VendingMachine.PaymentOperation',
                        'Elixir.VendingMachine.PaymentService',
                        'Elixir.VendingMachine.Server',
                        'Elixir.VendingMachine.Stock']},
              {registered,[]},
              {vsn,"0.1.0"}]}.
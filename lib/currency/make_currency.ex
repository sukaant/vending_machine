defmodule VendingMachine.MakeCurrency do
  alias VendingMachine.CurrencyNote
  alias VendingMachine.CurrencyCoin

  def make_currency(currency_specification) do
    case currency_specification do
      100.00 ->
        %CurrencyNote{
          background_color: "Teal",
          fluorescent_strip_color: "Pink",
          obverse: "Benjamin Franklin",
          reverse: "Independence Hall"
        }

      50.00 ->
        %CurrencyNote{
          background_color: "Pink",
          fluorescent_strip_color: "Yellow",
          obverse: "Ulysses S. Grant",
          reverse: "United States Capitol"
        }

      20.00 ->
        %CurrencyNote{
          background_color: "Green",
          fluorescent_strip_color: "Green",
          obverse: "Andrew Jackson",
          reverse: "White House"
        }

      10.00 ->
        %CurrencyNote{
          background_color: "Orange",
          fluorescent_strip_color: "Orange",
          obverse: "Alexander Hamilton",
          reverse: "Treasury Building"
        }

      5.00 ->
        %CurrencyNote{
          background_color: "Purple",
          fluorescent_strip_color: "Blue",
          obverse: "Abraham Lincoln",
          reverse: "Lincoln Memorial"
        }

      2.00 ->
        %CurrencyNote{
          background_color: "Green",
          fluorescent_strip_color: "None",
          obverse: "Thomas Jefferson",
          reverse: "Declaration of Independence by John Trumbull"
        }

      1.00 ->
        %CurrencyNote{
          background_color: "Green",
          fluorescent_strip_color: "None",
          obverse: "George Washington",
          reverse: "Great Seal of the United States"
        }

      0.50 ->
        %CurrencyCoin{diameter: 1.205, thickness: 2.15, mass: 11.340}

      0.25 ->
        %CurrencyCoin{diameter: 0.955, thickness: 1.75, mass: 5.670}

      0.10 ->
        %CurrencyCoin{diameter: 0.705, thickness: 1.35, mass: 2.268}

      0.05 ->
        %CurrencyCoin{diameter: 0.835, thickness: 1.95, mass: 5.000}

      0.01 ->
        %CurrencyCoin{diameter: 0.750, thickness: 1.55, mass: 2.500}

      # 1.01 ->
      #   %CurrencyCoin{diameter: 1.043, thickness: 2.00, mass: 8.100}

      _ ->
        0.00
    end
  end
end

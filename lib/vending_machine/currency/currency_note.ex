defmodule VendingMachine.CurrencyNote do
  @enforce_keys [:background_color, :fluorescent_strip_color, :obverse, :reverse]
  defstruct [:background_color, :fluorescent_strip_color, :obverse, :reverse]

  @currency_notes [100, 50, 20, 10, 5, 2, 1]

  def validate_note_and_get_value(note_specification) do
    case note_specification do
      %__MODULE__{
        background_color: "Green",
        fluorescent_strip_color: "None",
        obverse: "George Washington",
        reverse: "Great Seal of the United States"
      } ->
        1.00

      %__MODULE__{
        background_color: "Green",
        fluorescent_strip_color: "None",
        obverse: "Thomas Jefferson",
        reverse: "Declaration of Independence by John Trumbull"
      } ->
        2.00

      %__MODULE__{
        background_color: "Purple",
        fluorescent_strip_color: "Blue",
        obverse: "Abraham Lincoln",
        reverse: "Lincoln Memorial"
      } ->
        5.00

      %__MODULE__{
        background_color: "Orange",
        fluorescent_strip_color: "Orange",
        obverse: "Alexander Hamilton",
        reverse: "Treasury Building"
      } ->
        10.00

      %__MODULE__{
        background_color: "Green",
        fluorescent_strip_color: "Green",
        obverse: "Andrew Jackson",
        reverse: "White House"
      } ->
        20.00

      %__MODULE__{
        background_color: "Pink",
        fluorescent_strip_color: "Yellow",
        obverse: "Ulysses S. Grant",
        reverse: "United States Capitol"
      } ->
        50.00

      %__MODULE__{
        background_color: "Teal",
        fluorescent_strip_color: "Pink",
        obverse: "Benjamin Franklin",
        reverse: "Independence Hall"
      } ->
        100.00

      _ ->
        0.00
    end
  end

  def get_note_list, do: @currency_notes
end

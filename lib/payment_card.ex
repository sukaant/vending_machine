defmodule VendingMachine.PaymentCard do
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    String.to_integer(number)
    |> Integer.digits()
    |> IO.inspect(label: "Hello: ")
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(&luhn_formula/1)
    |> Enum.sum()
  end

  def valid?(number) do
    checksum(number) |> rem(10) == 0
  end

  def create(number) do
    number <> "#{checksum(number <> "0") |> complement}"
  end

  defp complement(chksum), do: rem(10 - rem(chksum, 10), 10)

  defp luhn_formula({digit, index}) when rem(index, 2) == 0, do: digit
  defp luhn_formula({digit, _}) when digit * 2 > 9, do: digit * 2 - 9
  defp luhn_formula({digit, _}), do: digit * 2
end

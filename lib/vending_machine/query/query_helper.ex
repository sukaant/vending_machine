defmodule VendingMachine.QueryHelper do

  def execute_query(query_param) do
    connection()
    |> Bolt.Sips.query!(query_param)
  end

  defp connection() do
    Bolt.Sips.conn()
  end
end

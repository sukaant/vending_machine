defmodule VendingMachine.QueryHelper do

  alias Bolt.Sips

  def merge_node_query(query_params) do
    """
    MERGE (n:#{Keyword.fetch!(query_params, :node_name)} #{Keyword.fetch!(query_params, :param)})
    #{on_create(Keyword.get(query_params, :on_create))}
    #{on_match(Keyword.get(query_params, :on_match))}
    RETURN n
    """
    |> execute_query()
  end

  def execute_query(query) do
    connection()
    |> Sips.query!(query)
  end

  defp connection() do
    Sips.conn()
  end

  defp on_create(create_value) do
    case !is_nil(create_value) do
      true -> "ON CREATE SET #{create_value |> Enum.map(fn {k, v} -> "n.#{k} = #{v}" end) |> Enum.join(", ")}"
      _ -> ""
    end
  end

  defp on_match(match_value) do
    case !is_nil(match_value) do
      true -> "ON MATCH SET #{match_value |> Enum.map(fn {k, v} -> "n.#{k} = #{v}" end) |> Enum.join(", ")}"
      _ -> ""
    end
  end
end

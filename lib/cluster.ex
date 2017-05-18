defmodule Kong.Cluster do
  @endpoint "/cluster"

  import Kong, only: [get: 1, delete: 1]

  @doc """
  Cluster information

  The entrypoint to the clustering API functionalities. Shows the total number of events that have been handled by the current node, and their types. The types starting with ENTITY_ are events for database entities, while the types that start with MEMBER- are events of the cluster and its members.
  """
  def info, do: get(@endpoint)

  @doc """
  Retrieve cluster status

  Retrieve the cluster status, returning information for each node in the cluster.
  """
  def status, do: get(@endpoint <> "/nodes")

  @doc """
  Forcibly remove a node

  Forcibly remove a node from the cluster.
  """
  def remove_node(name), do: delete(@endpoint <> "/nodes/#{name}")
end

defmodule Kong.Node do
  import Kong, only: [get: 1]

  @doc """
  Retrieve node information

  Retrieve generic details about a node.
  """
  def info, do: get("/")

  @doc """
  Retrieve node status

  Retrieve usage information about a node, with some basic information about the connections being processed by the underlying nginx process, and the number of entities stored in the datastore collections (including plugin's collections).
  """
  def status, do: get("/status")
end

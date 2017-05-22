defmodule Kong.Plugin do
  @endpoint "/plugins"

  import Kong, only: [get: 1, get: 3, post: 2]

  @doc """
  Add Plugin to all APIs
  """
  def add(attributes), do: post(@endpoint, attributes)

  @doc """
  Retrieve Plugin
  """
  def retrieve(id), do: get(@endpoint <> "/#{id}")

  @doc """
  Retrieve Enabled Plugins
  """
  def retrieve_enabled, do: get(@endpoint <> "/enabled")

  @doc """
  Retrieve Plugin Schema
  """
  def retrieve_schema(name), do: get(@endpoint <> "/schema/#{name}")

  @doc """
  List  All Plugins
  """
  def list(opts \\ []), do: get(@endpoint, [], params: opts)
end

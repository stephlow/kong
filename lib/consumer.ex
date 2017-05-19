defmodule Kong.Consumer do
  @endpoint "/consumers"

  import Kong, only: [get: 1, get: 3, patch: 2, put: 2, delete: 1]

  @doc """
  Retrieve Consumer
  """
  def retreive(username_or_id), do: get(@endpoint <> "/#{username_or_id}")

  @doc """
  List Consumers
  """
  def list(opts \\ []), do: get(@endpoint, [], params: opts)

  @doc """
  Update Consumer
  """
  def update(%{:id => id} = attributes), do: patch(@endpoint <> "/#{id}", attributes)
  def update(%{:name => name} = attributes), do: patch(@endpoint <> "/#{name}", attributes)

  @doc """
  Update Or Create Consumer
  """
  def update_or_create(attributes), do: put(@endpoint, attributes)

  @doc """
  Remove Consumer
  """
  def remove(username_or_id), do: delete(@endpoint <> "/#{username_or_id}")
end

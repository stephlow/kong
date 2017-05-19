defmodule Kong.Consumer do
  @endpoint "/consumers"

  import Kong, only: [get: 1, get: 3, post: 2, patch: 2, put: 2, delete: 1]

  @doc """
  Add Consumer
  """
  def add(attributes), do: post(@endpoint, attributes)

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
  def update(username_or_id, attributes), do: patch(@endpoint <> "/#{username_or_id}", attributes)

  @doc """
  Update Or Create Consumer
  """
  def update_or_create(attributes), do: put(@endpoint, attributes)

  @doc """
  Remove Consumer
  """
  def remove(username_or_id), do: delete(@endpoint <> "/#{username_or_id}")

  @doc """
  Add Credentials
  """
  def add_credentials(username_or_id, plugin, attributes \\ %{}), do: post(@endpoint <> "/#{username_or_id}/#{plugin}", attributes)
end

defmodule Kong.Consumer do
  @endpoint "/consumers"

  import Kong, only: [get: 1, patch: 2, put: 2, delete: 1]

  @doc """
  Retrieve Consumer
  """
  def retreive(username_or_id), do: get(@endpoint <> "/#{username_or_id}")

  @doc """
  List Consumers
  """
  def list, do: get(@endpoint)

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
end

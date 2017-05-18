defmodule Kong.API do
  @endpoint "/apis"

  import Kong, only: [get: 1, post: 2, patch: 2, put: 2, delete: 1]

  @doc """
  Add API
  """
  def add(attributes), do: post(@endpoint, attributes)

  @doc """
  Retrieve API
  """
  def retrieve(name_or_id), do: get(@endpoint <> "/#{name_or_id}")

  @doc """
  List APIs
  """
  def list, do: get(@endpoint)

  @doc """
  Update API
  """
  def update(name_or_id, attributes), do: patch(@endpoint <> "/#{name_or_id}", attributes)

  @doc """
  Update Or Create API
  """
  def update_or_create(attributes), do: put(@endpoint, attributes)

  @doc """
  Remove API
  """
  def remove(name_or_id), do: delete(@endpoint <> "/#{name_or_id}")
end

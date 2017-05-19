defmodule Kong.API do
  @endpoint "/apis"

  import Kong, only: [get: 1, get: 3, post: 2, patch: 2, put: 2, delete: 1]

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
  def list(opts \\ []), do: get(@endpoint, [], params: opts)

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

  @doc """
  Add Plugin to API
  """
  def add_plugin(name_or_id, attributes), do: post(@endpoint <> "/#{name_or_id}/plugins", attributes)

  @doc """
  List Plugins per API
  """
  def list_plugins(name_or_id, opts \\ []), do: get(@endpoint <> "/#{name_or_id}/plugins", [], params: opts)

  @doc """
  Update Plugin
  """
  def update_plugin(name_or_id, plugin_name_or_id, attributes), do: patch(@endpoint <> "/#{name_or_id}/plugins/#{plugin_name_or_id}", attributes)

  @doc """
  Update or Add Plugin
  """
  def update_or_add_plugin(name_or_id, attributes), do: put(@endpoint <> "/#{name_or_id}/plugins", attributes)

  @doc """
  Remove Plugin
  """
  def remove_plugin(name_or_id, plugin_name_or_id), do: delete(@endpoint <> "/#{name_or_id}/#{plugin_name_or_id}")
end

defmodule Kong.API do
  @moduledoc """
  Provides access to the Kong endpoints for API management.

  Consult the Kong Admin API documentation for more information about the API object properties
  """

  @endpoint "/apis"

  import Kong, only: [get: 1, get: 3, post: 2, patch: 2, put: 2, delete: 1]

  @doc """
  Adds a new API to Kong with the given map `attributes`.

  Returns either `{:ok, result}` where result is a map with the newly created API or `{:error, reasons}` where reasons is a map containing information.
  """
  def add(attributes), do: post(@endpoint, attributes)

  @doc """
  Retrieve an API from Kong with the given `name_or_id` string.

  Returns either `{:ok, result}` where result is a map with the API or `{:error, reasons}` where reasons is a map containing information.
  """
  def retrieve(name_or_id), do: get(@endpoint <> "/#{name_or_id}")

  @doc """
  List APIs from Kong based on the given `opts` Keyword List.

  Keywords defined in opts are mapped to the Querystring parameters of the request to Kong.

  Returns either `{:ok, result}` where result is the paginated result returned by Kong, or `{:error, reasons}` where reasons is a map containing information.
  """
  def list(opts \\ []), do: get(@endpoint, [], params: opts)

  @doc """
  Update API in Kong with the given string `name_or_id` with the given map `attributes`.

  Returns either `{:ok, result}` where result is a map with the updated API or `{:error, reasons}` where reasons is a map containing information.
  """
  def update(name_or_id, attributes), do: patch(@endpoint <> "/#{name_or_id}", attributes)

  @doc """
  Update Or Create API in Kong with the given map `attributes`.

  Returns either `{:ok, result}` where result is a map with the created / updated API or `{:error, reasons}` where reasons is a map containing information.
  """
  def update_or_create(attributes), do: put(@endpoint, attributes)

  @doc """
  Remove API from Kong with the given string `name_or_id`.

  Returns either `{:ok, result}` where result is a map with the newly created API or `{:error, reasons}` where reasons is a map containing information.
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

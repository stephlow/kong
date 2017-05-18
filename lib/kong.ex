defmodule Kong do
  @moduledoc false

  use HTTPoison.Base

  def process_url(url) do
    Application.get_env(:kong, :host, "http://localhost:8001")<> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  def process_request_headers(headers), do: Keyword.put_new(headers, :"Content-Type", "application/json")

  def get(url, headers \\ [], options \\ []) when is_binary(url) do
    url
    |> super(headers, options)
    |> transform_response()
  end

  def put(url, body \\ %{}, headers \\ [], options \\ []) do
    url
    |> super(Poison.encode!(body), headers, options)
    |> transform_response()
  end

  def post(url, body, headers \\ [], options \\ []) do
    url
    |> super(Poison.encode!(body), headers, options)
    |> transform_response()
  end

  def patch(url, body, headers \\ [], options \\ []) do
    url
    |> super(Poison.encode!(body), headers, options)
    |> transform_response()
  end

  def delete(url, headers \\ [], options \\ []) do
    url
    |> super(headers, options)
    |> transform_response()
  end

  defp transform_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 204, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:error, body}
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        {:error, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end

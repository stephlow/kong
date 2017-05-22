# Kong

Simple wrapper around the Kong Admin REST API.

## Requirements

- Kong (0.10.x)

## Installation

Kong is [available in Hex](https://hex.pm/packages/kong), the package can be installed
by adding `kong` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:kong, "~> 0.0.1"}]
end
```

## Configuration

You can configure which Node the client connects with. If not set, it will default to `http://localhost:8001`.

```elixir
config :kong, host: "http://example.com:8001"
```

## Examples

This library mostly maps Elixir types to Kong Admin API requests and responses. You should consult the Kong documentation on how to form your requests.

List APIs:

```elixir
{:ok, apis} = Kong.API.list
```

Passing Querystring parameters to the list call:

```elixir
{:ok, page_one} = Kong.API.list size: 10
{:ok, page_two} = Kong.API.list size: 10, offset: page_one["offset"]
```

Creating a new API:

```elixir
{:ok, api} = Kong.API.add %{name: "Testing", upstream_url: "http://localhost:4000/api", hosts: ["api.example.com"]}
```

## Documentation

Documentation can be found at [https://hexdocs.pm/kong](https://hexdocs.pm/kong).

## ToDo

### Client

- [ ] Tests

### Routes

- [x] Node Routes
- [x] Cluster Routes
- [x] API Routes
- [x] Consumer Routes
- [x] Plugin Routes
- [ ] Certificate Routes
- [ ] SNI Routes
- [ ] Upstream Routes
- [ ] Target Routes

# Kong

Simple wrapper around the Kong Admin REST API.

## Requirements

- Kong

## Installation

Kong is [available in Hex](https://hex.pm/docs/publish), the package can be installed
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
